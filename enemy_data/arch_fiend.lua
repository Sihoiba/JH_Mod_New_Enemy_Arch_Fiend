register_blueprint "apply_acided"
{
	callbacks = {
		on_damage = [[
			function ( unused, weapon, who, amount, source )
				if who and who.data and who.data.can_bleed then
					local slevel = core.get_status_level( weapon, "acided", source )
					core.apply_damage_status( who, "acided", "acid", slevel, source )
				end
			end
		]],
	}
}

register_blueprint "fiend_acidclaws"
{
	weapon = {
		group = "melee",
		type  = "melee",
		natural = true,
		damage_type = "slash",
		fire_sound = "fiend_melee",
		hit_sound  = "blunt",
	},
	attributes = {
		damage      = 10,
		accuracy    = 30,
		armor_damage = 3.0,
		slevel      = { bleed = 3, acided = 3 },
	},
	callbacks = {
		on_create = [=[
		function( self )
			self:attach( "apply_bleed" )
			self:attach( "apply_acided" )
		end
		]=],
	},	
}

register_blueprint "arch_fiend"
{
	blueprint = "fiend_base",
	ascii     = {
		glyph     = "i",
		color     = PURPLE,
	},
	lists = {
		group = "being",
		-- { keywords = { "test2" }, weight = 150 },
		-- { keywords = { "callisto", "europa", "demon", "demon1" }, weight = 500, dmin = 1, dmax = 10, },
		{ 2, keywords = { "dante", "beyond", "demon", "demon1", "hard" }, weight = 250, dmin = 22, dmax = 27, },
		{ 3, keywords = { "dante", "beyond", "demon", "demon1", "hard" }, weight = 75, dmin = 23, },
		{ 5, keywords = { "dante", "beyond", "swarm", "demon", "demon1", "hard" },  weight = 25, dmin = 26, },
	},
	text = {
		name      = "arch fiend",
		namep     = "arch fiends",
	},
	callbacks = {
		on_create = [=[
		function( self )
			self:attach( "fiend_acidclaws" )
		end
		]=],
		on_die = [=[
			function( self, killer, current, weapon )
				local p = world:get_position( self )
				local level = world:get_level()
				local nlist  = { coord( p.x - 1, p.y - 1 ), coord( p.x , p.y - 1), coord( p.x + 1, p.y - 1 ), coord( p.x - 1, p.y ), p, coord( p.x + 1, p.y ), coord( p.x - 1, p.y + 1 ), coord( p.x , p.y + 1), coord( p.x + 1, p.y + 1 )}
				for _,c in ipairs( nlist ) do
					local pool = level:get_entity(c, "acid_pool" )
					if not pool then
						pool = level:place_entity( "acid_pool", c )
					end
					pool.attributes.acid_amount = 10
					pool.lifetime.time_left = math.max( pool.lifetime.time_left, 400 + math.random(100) )
				end
				
			end
		]=],
	},
	attributes = {
		speed = 1.25,
		experience_value = 50,
		health   = 50,
		accuracy = 10,
		resist = {
			melee = 25,
			slash = 25,
			impact = 25,
			fire = 50,
			acid = 100,
		},
	},
	data = {
		nightmare = {
			id   = "exalted_arch_fiend",
		},
	}
}

register_blueprint "exalted_arch_fiend"
{
	blueprint = "arch_fiend",
	lists = {
		group = "exalted",
		weight = 100,
		dmin   = 5,
	},
	text = {
		name      = "exalted arch fiend",
		namep     = "exalted arch fiends",
	},
	ascii     = {
		glyph     = "i",
		color     = LIGHTMAGENTA,
	},
	desc = {},
	callbacks = {
		on_create = [=[
		function( self,_,tier )
			self:attach( "fiend_acidclaws" )
			if tier > 1 then
				make_exalted( self, tier, self.data.exalted_traits )
			end
		end
		]=],
	},
	attributes = {
		speed = 1.25,
		experience_value = 100,
		health = 60,
		accuracy = 10,
	},
	data = {
		nightmare = false,
		exalted_traits = {
			danger = 6,
			{ "exalted_kw_unstable", },
			{ "exalted_kw_hunter", min = 6, },
			{ "exalted_kw_resilient", tag = "health" },
			{ "exalted_kw_armored", },
			{ "exalted_kw_regenerate", tag = "health", min = 6, },
			{ "exalted_kw_lethal", min = 7, tag = "damage", }, 
			{ "exalted_kw_deadly", min = 14, tag = "damage", }, 			
			{ "exalted_kw_fast", min = 14, },
			{ "exalted_kw_resist", min = 14, },
		},
	},
	inventory = {},
}