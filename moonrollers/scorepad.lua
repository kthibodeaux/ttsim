local dice = {}

function onLoad()
  local dieGuids = {
    "061982",
    "334cf1",
    "2d8b61",
    "e2f79d",
    "15acc4",
    "220f57",
    "b56c9b",
    "223c87",
    "c3c364",
    "84c238",
    "7b18a5",
    "2ba4d4"
  }

  for i, id in ipairs(dieGuids) do
    local obj = {
      guid = id,
      originalPosition = getObjectFromGUID(id).getPosition(),
      originalRotation = getObjectFromGUID(id).getRotation()
    }
    table.insert(dice, obj)
  end
end

function reset(player, _, _)
  prepareDice(0, player)
end

function five(player, _, _)
  prepareDice(5, player)
end

function six(player, _, _)
  prepareDice(6, player)
end

function prepareDice(numberOfDice, player)
  for i = 1, 12 do
    local die = dice[i]
    local obj = getObjectFromGUID(die.guid)

    obj.setPositionSmooth(die.originalPosition)
    obj.setRotationSmooth(die.originalRotation)
  end

  for i = 12 - numberOfDice + 1, 12 do
    local die = dice[i]
    local obj = getObjectFromGUID(die.guid)

    local newPosition = {
      die.originalPosition.x + 10,
      die.originalPosition.y,
      die.originalPosition.z - 4
    }

    obj.setPositionSmooth(newPosition)
    obj.addToPlayerSelection(player.color)
  end
end
