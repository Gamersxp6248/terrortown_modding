local ROUND = {}
ROUND.Name = "Supernova"
ROUND.Description = "Every innocent explodes on death!"

function ROUND:Start()
	timer.Simple(1, function()
		if SERVER then
			for _, ply in pairs(player.GetAll()) do
				if ply:GetRole() == ROLE_INNOCENT then
					ply:SetRole(ROLE_NOVA)
				end
			end
		end

		if CLIENT then
			local ply = LocalPlayer()
			if ply:GetRole() == ROLE_INNOCENT then
				ply:SetRole(ROLE_NOVA)
			end
		end
	end)
end

return RegisterChaosRound(ROUND)
