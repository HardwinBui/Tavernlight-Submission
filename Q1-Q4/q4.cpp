// Avoid memory leaks by deallocating the player if it was ever allocated

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    bool createdPlayer = false; // true if we allocated new memory for the player
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player; // free memory of player if load fails
            return;
        }
        createdPlayer = true;
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        if(createdPlayer) {
            delete player; // free memory of player if item fails to be made
        }
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    } 
    else if(createdPlayer) {
        delete player; // free memory of player if they didn't get saved
    }
}