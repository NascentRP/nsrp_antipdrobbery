QBCore = exports['qb-core']:GetCoreObject()

local PlayerJob = 'unemployed'
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
  PlayerJob = QBCore.Functions.GetPlayerData().job
end)

Citizen.CreateThread(function()
  if QBCore ~= nil then
    PlayerJob = QBCore.Functions.GetPlayerData().job
  end
end)

Citizen.CreateThread(function()
  while true do
    local ped = PlayerPedId()
    if IsPedShooting(ped) and PlayerJob.name ~= 'police' then
      local weaponId = GetSelectedPedWeapon(ped)
      if isWeaponAPoliceWeapon(weaponId) then
        TriggerEvent('weapons:client:SetWeaponQuality', 0)
      end
    end
    Wait(0)
  end
end)

function isWeaponAPoliceWeapon(weaponId)
  for k, v in ipairs(Config.PoliceWeapons) do
    if weaponId == v then
      return true
    end
  end
  return false
end