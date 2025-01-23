local dice = {}

function onLoad()
  local dieGuids = {
    "bab66a",
    "e60684",
    "bcda87",
    "7e2b7e",
    "fd3269",
    "d8a2ca"
  }

  for i, id in ipairs(dieGuids) do
    local obj = {
      guid = id,
      originalPosition = getObjectFromGUID(id).getPosition(),
      -- originalRotation = getObjectFromGUID(id).getRotation()
    }
    table.insert(dice, obj)
  end
end

function reset()
  for i = 1, 6 do
    local die = dice[i]
    local obj = getObjectFromGUID(die.guid)

    obj.setPositionSmooth(die.originalPosition)
    -- obj.setRotationSmooth(die.originalRotation)
  end
end
