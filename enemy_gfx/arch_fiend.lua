register_gfx_blueprint "fiend_acidclaws"
{
	weapon_fx = {
		advance   = 0.4,
	},
	equip = {},
}

register_gfx_blueprint "arch_fiend"
{
	animator = "animator_fiend",
	scale = {
		scale = 1.1,
	},
	style = {
		materials = {
			body      = "enemy_gfx/textures/demon_implike/demon_implike_01",
			spikes_01 = "enemy_gfx/textures/demon_implike/demon_implike_spikes_01",
			spikes_02 = "enemy_gfx/textures/demon_implike/demon_implike_spikes_02",
			spikes_03 = "enemy_gfx/textures/demon_implike/demon_implike_spikes_03",
		},
	},
	blueprint = "fiend_base",
}