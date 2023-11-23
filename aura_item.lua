local itemData = {
    [4540] = "Название предмета 1",
    [9998825] = "Звездопад",
    [9998826] = "Знак любви",
    -- Добавьте другие предметы по аналогии
}

local function OnItemUse(event, player, item, target)
    local itemID = item:GetEntry()

    if itemData[itemID] then
        local accountID = player:GetAccountId()
        local itemName = itemData[itemID]

        player:RemoveItem(itemID, 1) -- Удалить предмет из инвентаря

        local query = CharDBQuery(string.format(
            "INSERT INTO `acore_characters`.`personal_obs_loot` (`account_id`, `item_id`, `item_name`) VALUES (%d, %d, '%s')",
            accountID, itemID, itemName
        ))

        if query then
            player:SendBroadcastMessage("Не удалось добавить предмет в коллекцию.")
        else
            player:SendBroadcastMessage("Предмет '" .. itemName .. "' добавлен в вашу коллекцию.")
        end
    end
end

RegisterItemEvent(4540, 2, OnItemUse) -- Замените 12345 на Entry (ID) вашего предмета
RegisterItemEvent(9998825, 2, OnItemUse) -- Замените 12345 на Entry (ID) вашего предмета
RegisterItemEvent(9998826, 2, OnItemUse) -- Замените 12345 на Entry (ID) вашего предмета
