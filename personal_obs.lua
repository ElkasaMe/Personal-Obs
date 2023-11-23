local GobId = 123
local NpcId = 123
local ItemId = 100002 -- Прмед для открытия меню
local StarID = 9998825 -- Звезодпал
local HeartID = 9998826 -- Знак любви
local MenuId = 123 -- Уникальное id меню 

local function OnGossipHello(event, player, object)
    player:GossipClearMenu() 
    player:GossipMenuAddItem(0, "Визуальные эффекты", 1, 1)
    player:GossipMenuAddItem(0, "Морфы", 1, 2)
    player:GossipMenuAddItem(0, "Телепорты", 1, 3)
    player:GossipMenuAddItem(0, "Промокод", 1, 4)
    player:GossipSendMenu(1, object, MenuId) -- 
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipMenuAddItem(0, "Холод", 1, 100)
        player:GossipMenuAddItem(0, "Зеленый огонь", 1, 101)
        player:GossipMenuAddItem(0, "Аура светлой сущности", 1, 102)
        player:GossipMenuAddItem(0, "Темная скорбь", 1, 103)
        player:GossipMenuAddItem(0, "Святая аура", 1, 104)
        local query = CharDBQuery("SELECT * FROM personal_obs_loot WHERE item_id = " .. StarID)
    if query then
        player:GossipMenuAddItem(0, "Звездопад", 1, 105)
    end
		local query = CharDBQuery("SELECT * FROM personal_obs_loot WHERE item_id = " .. HeartID)
    if query then
        player:GossipMenuAddItem(0, "Знак любви", 1, 106)
    end
        player:GossipMenuAddItem(0, "Аура страха", 1, 107)
		
		
		
		
		player:GossipMenuAddItem(0, "Отключить визуальные эффекты", 1, 199) 
        player:GossipSendMenu(1, object, MenuId) -- 
    elseif (intid == 2) then
        player:GossipMenuAddItem(0, "Человек", 1, 200)
        player:GossipMenuAddItem(0, "Человек жен.", 1, 201)
        player:GossipMenuAddItem(0, "Эльф крови", 1, 202)
        player:GossipMenuAddItem(0, "Эльф крови жен.", 1, 203)
        player:GossipMenuAddItem(0, "Гном", 1, 204)
        player:GossipMenuAddItem(0, "Гном жен.", 1, 205)
        player:GossipMenuAddItem(0, "Гоблин", 1, 206)
        player:GossipMenuAddItem(0, "Гоблин жен.", 1, 207)
        player:GossipMenuAddItem(0, "Андед.", 1, 208)
        player:GossipMenuAddItem(0, "Андед жен.", 1, 209)
        player:GossipMenuAddItem(0, "Ночной эльф.", 1, 210)
        player:GossipMenuAddItem(0, "Таурен ж", 1, 211)
        player:GossipMenuAddItem(0, "Таурен .", 1, 212)
        player:GossipMenuAddItem(0, "Дреней ж.", 1, 213)
        player:GossipMenuAddItem(0, "Тролль.", 1, 214)
        player:GossipMenuAddItem(0, "Орк жен.", 1, 215)
		player:GossipSendMenu(1, object, MenuId)
    elseif (intid == 3) then
        player:GossipMenuAddItem(0, "Столица", 1, 300)
        player:GossipMenuAddItem(0, "Даларан", 1, 301)
        player:GossipMenuAddItem(0, "Шаттрат", 1, 303)
        player:GossipMenuAddItem(0, "Рандом тп.", 1, 304)
		player:GossipSendMenu(1, object, MenuId)

    elseif (intid == 4) then -- intid для "Промокода"
    player:GossipMenuAddItem(0, "Введите промокод:", 1, 400, true) -- Добавляем codebox
    player:GossipSendMenu(1, object, MenuId)

		-- Ауры 
   elseif (intid == 100) then
        if player:HasAura(33900) then
            player:RemoveAura(33900)
        else
            player:AddAura(33900, player)
        end
        player:GossipComplete()
		
   elseif (intid == 101) then
        if player:HasAura(36006) then
            player:RemoveAura(36006)
        else
            player:AddAura(36006, player)
        end
        player:GossipComplete()
	elseif (intid == 102) then
        if player:HasAura(65712) then
            player:RemoveAura(65712)
        else
            player:AddAura(65712, player)
        end
        player:GossipComplete()
	elseif (intid == 103) then
        if player:HasAura(72523) then
            player:RemoveAura(72523)
        else
            player:AddAura(72523, player)
        end
        player:GossipComplete()
	elseif (intid == 104) then
        if player:HasAura(70788) then
            player:RemoveAura(70788)
        else
            player:AddAura(70788, player)
        end
        player:GossipComplete()	
	elseif (intid == 105) then
        if player:HasAura(65630) then
            player:RemoveAura(65630)
        else
            player:AddAura(65630, player)
        end
	elseif (intid == 106) then
        if player:HasAura(62011) then
            player:RemoveAura(62011)
        else
            player:AddAura(62011, player)
        end
        player:GossipComplete()	
	elseif (intid == 107) then
        if player:HasAura(69663) then
            player:RemoveAura(69663)
        else
            player:AddAura(69663, player)
        end
	elseif (intid == 199) then -- ID, которое вы использовали для кнопки
		player:RemoveAllAuras() -- Этот метод снимет все ауры с игрока
		player:GossipComplete() -- Закрываем меню после выполнения действия

        player:GossipComplete()		
-- Morphs
	elseif (intid == 200) then
        player:SetDisplayId(19723) 
        player:GossipComplete()
		
	elseif (intid == 201) then
        player:SetDisplayId(19724)
        player:GossipComplete()
		
	elseif (intid == 202) then
        player:SetDisplayId(20578) 
        player:GossipComplete()
		
	elseif (intid == 203) then
        player:SetDisplayId(20579) 
        player:GossipComplete()
		
	elseif (intid == 204) then
        player:SetDisplayId(20580) 
        player:GossipComplete()
		
	elseif (intid == 205) then
        player:SetDisplayId(20581) 
        player:GossipComplete()
		
	elseif (intid == 206) then
        player:SetDisplayId(20582) 
        player:GossipComplete()
		
	elseif (intid == 207) then
        player:SetDisplayId(20583)
        player:GossipComplete()
		
	elseif (intid == 208) then
        player:SetDisplayId(3533)
        player:GossipComplete()
		
	elseif (intid == 209) then
        player:SetDisplayId(3529) 
        player:GossipComplete()
		
	elseif (intid == 210) then
        player:SetDisplayId(20138) 
        player:GossipComplete()
		
	elseif (intid == 211) then
        player:SetDisplayId(20584)
        player:GossipComplete()
		
	elseif (intid == 212) then
        player:SetDisplayId(20585) 
        player:GossipComplete()
		
	elseif (intid == 213) then
        player:SetDisplayId(20323) 
        player:GossipComplete()
		
	elseif (intid == 214) then
        player:SetDisplayId(20321) 
        player:GossipComplete()
		
	elseif (intid == 215) then
        player:SetDisplayId(20316)
        player:GossipComplete()
		
	elseif (intid == 216) then
        player:SetDisplayId(20317) 
        player:GossipComplete()

-- Morph End
-- Код для тп по столицам. // Teleport 
	-- Код для тп по столицам. // Teleport 
elseif (intid == 300) then
    local race = player:GetRace()
    player:SendBroadcastMessage("Ваша раса: " .. race)  -- Отправляем результат в чат
    if race == 1 or race == 3 or race == 4 or race == 7 or race == 11 then
        player:Teleport(0, -8913.23, 554.633, 94.7944, 0)
    else
        player:Teleport(1, 1629.849976, -4373.640137, 31.557262, 3.697620)
    end
    player:GossipComplete()
-- Код для тп по столицам // Teleport end

-- Код для тп по столицам // Teleport end

-- Телеорт в Даларан // Dalaran
	elseif(intid == 301) then 
		player:Teleport(571, 5804.149902, 624.770966, 647.767029, 1)
		player:GossipComplete()
-- Телеорт в Даларан // Dalaran end
	
-- Телеорт в Шаттрат
	elseif(intid == 302) then 
		player:Teleport(530, -1832.103149, 5307.996582, -12.427571, 1)
		player:GossipComplete()
-- Телеорт в Шаттрат

elseif (intid == 400) then -- обработка ввода промокода
    local characterId = player:GetGUIDLow() -- Получаем ID персонажа
    local promoCodeQuery = CharDBQuery("SELECT item_reward, uses_left, gold_reward, loyalty_points_reward, reward_type FROM characters_promocode WHERE code = '" .. code .. "' AND uses_left > 0")
    local usedPromoQuery = CharDBQuery("SELECT * FROM character_used_promocodes WHERE character_id = " .. characterId .. " AND promo_code = '" .. code .. "'")

    if promoCodeQuery and not usedPromoQuery then
        -- Добавляем запись о том, что персонаж использовал промокод
        CharDBQuery("INSERT INTO character_used_promocodes (character_id, promo_code) VALUES (" .. characterId .. ", '" .. code .. "')")

        local itemReward = promoCodeQuery:GetUInt32(0)
        local usesLeft = promoCodeQuery:GetUInt32(1) - 1
        local goldReward = promoCodeQuery:GetUInt32(2)
        local loyaltyPoints = promoCodeQuery:GetUInt32(3)
        local rewardType = promoCodeQuery:GetString(4)

        if rewardType == "item" then
            player:AddItem(itemReward, 1)
        elseif rewardType == "gold" then
            player:ModifyMoney(goldReward)
        elseif rewardType == "loyalty_points" then
            -- Здесь добавляем бонусные очки лояльности к счету игрока
            -- Пример запроса, который нужно адаптировать к вашей системе
            AuthDBQuery("UPDATE player_points SET balance_loyal_point = balance_loyal_point + " .. loyaltyPoints .. " WHERE account_id = " .. player:GetAccountId())
        end

        CharDBQuery("UPDATE characters_promocode SET uses_left = " .. usesLeft .. " WHERE code = '" .. code .. "'")
        player:SendBroadcastMessage("|cff00ff00BladeFall|r: |cffffffffПромокод использован успешно!|r")
    else
        player:SendBroadcastMessage("|cff00ff00BladeFall|r: |cffff0000Вы уже использовали этот промокод!|r")
    end
    player:GossipComplete()
end




end

--	###Промокод####
--	###Promocode###
-- Определение массивов наград по уровням
-- Ваши массивы наград
local epicRewards = {
    { type = "item", id = 52200 },
    { type = "item", id = 50818 },
    { type = "item", id = 44168 },
    { type = "item", id = 44151 },
    { type = "item", id = 44707 },
    { type = "item", id = 54811 },
    { type = "item", id = 43953 },
    { type = "item", id = 45693 },
    { type = "item", id = 32768 },
    { type = "item", id = 51954 },
    { type = "item", id = 49636 },
    { type = "item", id = 19902 },
    { type = "item", id = 43952 },
    { type = "item", id = 32458 },
    { type = "item", id = 54860 },
    { type = "gold", amount = 20000 },
    { type = "loyalty_points", amount = 1 }
}

local rareRewards = {
    { type = "item", id = 32768 },
    { type = "item", id = 9998826 },
    { type = "item", id = 9998825 },
    { type = "item", id = 198628 },
    { type = "item", id = 198632 },
    { type = "item", id = 27819 },
    { type = "item", id = 37598 },
    { type = "item", id = 43963 },
    { type = "item", id = 43964 },
    { type = "item", id = 27853 },
    { type = "item", id = 32318 },
    { type = "item", id = 33182 },
    { type = "item", id = 198631 },
    { type = "item", id = 32314 },
    { type = "item", id = 198630 },
    { type = "item", id = 45802 },
    { type = "item", id = 28915 },
    { type = "item", id = 33225 },
    { type = "item", id = 33977 },
    { type = "item", id = 40777 },
    { type = "item", id = 43952 },
    { type = "item", id = 44234 },
    { type = "item", id = 43951 },
    { type = "item", id = 44164 },
    { type = "item", id = 44160 },
    { type = "item", id = 33809 },
    { type = "item", id = 54069 },
    { type = "item", id = 43954 },
    { type = "item", id = 43955 },
    { type = "item", id = 44175 },
    { type = "item", id = 44177 },
    { type = "item", id = 45801 },
    { type = "item", id = 50250 },
    { type = "item", id = 19872 },
    { type = "item", id = 30480 },
    { type = "item", id = 54860 },
	{ type = "item", id = 37827 },
    { type = "item", id = 34493 },
    { type = "item", id = 23712 },
    { type = "item", id = 23713 },
    { type = "gold", amount = 15000 },
    { type = "loyalty_points", amount = 1 }
}

local commonRewards = {
    { type = "item", id = 55555 },
    { type = "item", id = 46109 },
    { type = "item", id = 41508 },
    { type = "item", id = 44413 },
    { type = "item", id = 19902 },
    { type = "item", id = 198632 },
    { type = "item", id = 198628 },
    { type = "item", id = 43599 },
    { type = "item", id = 49283 },
    { type = "item", id = 49285 },
    { type = "item", id = 33976 },
    { type = "item", id = 21736 },

	
	-- Предметы
    { type = "item", id = 54537 },
    { type = "item", id = 34480 },
    { type = "item", id = 50160 },
    { type = "item", id = 54535 },
    { type = "item", id = 21519 },
    { type = "item", id = 21536 },
    { type = "item", id = 21310 },
    { type = "item", id = 23022 },
    { type = "item", id = 17726 },
    { type = "item", id = 34426 },
    { type = "item", id = 21569 },
    { type = "item", id = 22218 },
    { type = "item", id = 21213 },
    { type = "item", id = 21818 },
    { type = "item", id = 22261 },
    { type = "item", id = 34684 },
    { type = "item", id = 34191 },
    { type = "item", id = 21216 },
    { type = "item", id = 37816 },
    { type = "item", id = 8494 },
    { type = "item", id = 49287 },
    { type = "item", id = 49665 },
    { type = "item", id = 54810 },
    { type = "item", id = 44794 },
    { type = "item", id = 49663 },
    { type = "item", id = 53641 },
    { type = "item", id = 49343 },
    { type = "item", id = 45022 },
    { type = "item", id = 44982 },
    { type = "gold", amount = 10000 },
    { type = "loyalty_points", amount = 1 }
}

-- Функция для случайного выбора уровня награды
local function SelectRewardLevel()
    local roll = math.random(100)
    if roll <= 1 then
        return epicRewards
    elseif roll <= 7 then
        return rareRewards
    else
        return commonRewards
    end
end

-- Функция для выбора типа награды на основе заданных шансов
local function SelectRewardType(rewardArray)
    local rewardTypeChances = {
        item = 15,          -- 30% шанс выбрать предмет
        gold = 15,          -- 20% шанс выбрать золото
        loyalty_points = 70 -- 50% шанс выбрать поинты лояльности
    }

    local totalWeight = 0
    for _, reward in ipairs(rewardArray) do
        totalWeight = totalWeight + (rewardTypeChances[reward.type] or 0)
    end

    local roll = math.random(totalWeight)
    local cumulativeChance = 0

    for _, reward in ipairs(rewardArray) do
        cumulativeChance = cumulativeChance + (rewardTypeChances[reward.type] or 0)
        if roll <= cumulativeChance then
            return reward
        end
    end
end

-- Функция для выбора случайной награды из массива
local function GetRandomRewardFromArray()
    local rewardArray = SelectRewardLevel()
    local selectedReward = SelectRewardType(rewardArray)
    if selectedReward and selectedReward.type == "gold" then
        -- Генерация случайного количества золота в диапазоне от 1 до 10000
        selectedReward.amount = math.random(1, 10000) * 10000
    end
	if selectedReward and selectedReward.type == "loyalty_points" then
        -- Генерация случайного количества золота в диапазоне от 1 до 10000
        selectedReward.amount = math.random(1, 50) * 1
    end
    return selectedReward
end

-- Генерация промокода
local function GeneratePromoCode()
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local code = ""
    for i = 1, 12 do
        local rand = math.random(#characters)
        code = code .. characters:sub(rand, rand)
    end
    return code
end

-- Функция для добавления промокода в базу данных и оповещения
local function AddPromoCodeToDBAndNotify()
    local promoCode = GeneratePromoCode()
    local reward = GetRandomRewardFromArray()

    if reward.type == "item" then
        CharDBQuery("INSERT INTO characters_promocode (code, item_reward, reward_type, uses_left) VALUES ('" .. promoCode .. "', " .. reward.id .. ", 'item', 3);")
    elseif reward.type == "gold" then
        CharDBQuery("INSERT INTO characters_promocode (code, gold_reward, reward_type, uses_left) VALUES ('" .. promoCode .. "', " .. reward.amount .. ", 'gold', 3);")
    elseif reward.type == "loyalty_points" then
        CharDBQuery("INSERT INTO characters_promocode (code, loyalty_points_reward, reward_type, uses_left) VALUES ('" .. promoCode .. "', " .. reward.amount .. ", 'loyalty_points', 3);")
    end
    SendWorldMessage("|cff00ff00BladeFall|r: |cffffffffНовый промокод доступен! Используйте его скорее: |r|cffff0000" .. promoCode .. "|r")
end

-- Обработка команды для генерации промокода
local function HandleGpromoCommand(event, player, command)
    if command == "gpromo" then
        local accountId = player:GetAccountId()
        local query = AuthDBQuery("SELECT gmlevel FROM account_access WHERE id = " .. accountId)

        if query and query:GetUInt32(0) > 3 then
            AddPromoCodeToDBAndNotify()
            player:SendBroadcastMessage("Промокод сгенерирован и добавлен в базу данных.")
        else
            player:SendBroadcastMessage("У вас нет доступа к этой команде.")
        end

        return false -- Предотвращает дальнейшую обработку команды сервером
    end
end



RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)

RegisterGameObjectGossipEvent(GobId, 1, OnGossipHello)
RegisterGameObjectGossipEvent(GobId, 2, OnGossipSelect)

RegisterItemGossipEvent(ItemId, 1, OnGossipHello)
RegisterItemGossipEvent(ItemId, 2, OnGossipSelect)

RegisterPlayerEvent(42, HandleGpromoCommand)
RegisterPlayerGossipEvent(MenuId, 2, OnGossipSelect)

CreateLuaEvent(AddPromoCodeToDBAndNotify, 10800000, 0) -- 10800000 миллисекунд = 3 часа