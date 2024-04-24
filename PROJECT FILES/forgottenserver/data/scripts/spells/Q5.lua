local combat = Combat()

SPELL_AREA = {
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 3, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 0, 0, 0, 0},
}

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) -- most of edit here
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(SPELL_AREA))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 8) + 50
	local max = (level / 5) + (magicLevel * 12) + 75
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Q5 Spell")
spell:words("frigo")
spell:group("attack")
spell:vocation("sorcerer", "druid", "citizen")
spell:id(24)
spell:cooldown(1 * 1)
spell:groupCooldown(1 * 1)
spell:level(10)
spell:mana(1)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()