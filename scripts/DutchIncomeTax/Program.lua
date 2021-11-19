include "modules/ZtModArchive/ArluqTools/scripts/arluq.lua"
include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"

function CalcIncomeTax(args)
    aq.try(
        function ()
            local atm = resolveTable(args[1].value)
            local name = atm:BFG_GET_ATTR_STRING("s_name")
            if string.sub(name, 1, 4) == "tax " then
                local income = tonumber(string.sub(name, 5))
                local tax = 0
                if income < 68508 then
                    tax = income * 0.371
                else
                    tax = 68508 * 0.371 + (income - 68508) * 0.495
                end
                atm:BFG_SET_ATTR_STRING("s_name", tostring(tax))

                local taxMessage = "Your income is: "..income..", your 2021 Dutch income tax will be: "..tax
                displayZooMessageTextWithZoom(taxMessage, 1, 30)
            end
        end
    )
end