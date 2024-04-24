local talk = TalkAction("!q7")

function talk.onSay(player, words, param)
    function moveButton(pos)
        local speed = 10
        local message = (pos * speed) % 200
        local window = ModalWindow(pos, title, 200 - message)
        window:sendToPlayer(player)
        addEvent(moveButton, 1, pos + 1)
    end
      
    moveButton(0)
	return false
end

talk:separator(" ")
talk:register()
