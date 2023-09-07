RegisterKeyMapping("InfoUser", "Aprire InfoUser", "keyboard", "F11")

RegisterCommand("InfoUser", function(bank)
    local hash = GetEntityModel(PlayerPedId())
    local sesso = nil
    if hash == `mp_m_freemode_01` then
        sesso = 'Maschio'
    elseif hash == `mp_f_freemode_01` then
        sesso = 'Femmina'
    else
        sesso = 'Ped Custom'
    end
    lib.registerContext({
        id = 'menu',
        title = 'PASSAPORTO',
        options = {
            {
                title = 'Generalità',
                description = 'Id: '..GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))..'\nNome: '..ESX.PlayerData.firstName..' \nCognome: '..ESX.PlayerData.lastName..' \nData di Nascita: '..ESX.PlayerData.dateofbirth..' \nAltezza: '..ESX.PlayerData.height..' \nSesso: '..sesso..'',
                icon = 'fa-solid fa-circle-info',
                iconColor = 'orange',
            },
            {
                title = 'Impiego',
                description = 'Lavoro Legale: '..ESX.PlayerData.job.label..'\nGrado Legale: '..ESX.PlayerData.job.grade_label..'\nSalario: '..ESX.PlayerData.job.grade_salary..'',
                icon = 'fa-solid fa-briefcase',
                iconColor = 'orange',
            },
            {
                title = 'Patrimonio',
                description = 'Saldo Bancario: '..Config.GetAccounts('bank')..' $\nContanti: '..Config.GetAccounts('money')..' $\nSaldo Sporco: '..Config.GetAccounts('black_money')..' $',
                icon = 'fa-solid fa-wallet',
                iconColor = 'orange',
            },
            {
                title = 'Inventario',
                description = 'Oggetti: '..#ESX.PlayerData.inventory..'\nPeso: '..ESX.PlayerData.weight..' KG\n Peso Massimo: '..ESX.PlayerData.maxWeight..' KG',
                icon = 'fa-solid fa-weight-hanging',
                iconColor = 'orange',
            },
        }
    })
    lib.showContext('menu')
end)

Config = {}

Config.GetAccounts = function(name)
    for _,v in pairs(ESX.PlayerData.accounts) do
        if v.name == name then
            return v.money
        end
    end
end