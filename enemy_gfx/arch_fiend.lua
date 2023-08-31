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

register_gfx_blueprint "exalted_arch_fiend"
{
	animator = "animator_fiend",
	scale = {
		scale = 1.1,
	},
	style = {
		materials = {
			body      = "data/texture/demon_implike/D/demon_implike_01",
			spikes_01 = "data/texture/demon_implike/D/demon_implike_spikes_01",
			spikes_02 = "data/texture/demon_implike/D/demon_implike_spikes_02",
			spikes_03 = "data/texture/demon_implike/D/demon_implike_spikes_03",
		},
	},
	light = {
		position    = vec3(0,0.1,0),
		color       = vec4(1.5,0.75,2.25,1.0),
		range       = 1.5,
	},
	blueprint = "fiend_base",
}