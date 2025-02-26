--- STEAMODDED HEADER
--- MOD_NAME: Dingle Joker
--- MOD_ID: DINGLEJOKER
--- MOD_AUTHOR: [Kevin]
--- MOD_DESCRIPTION: Its a Joker, but Dingle.
--- PREFIX: DNGL
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'Jokers',
    path = 'Joker.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'dingleJoker',
    loc_txt = {
        name = 'Dingle Dangle',
        text = {
            'Gains {X:mult,C:white}X0.1{} Mult for every {C:attention} Flush{} played', 
            'Loses {X:mult,C:white}X0.1{} Mult for every {C:attention} Straight{} played',
            'Current Mult: {X:mult,C:white}X#1#{}' 
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    pos = {x = 0, y = 0},
    config = { 
        extra = {
            X_mult = 1,
            modd = 0.1,
        }
    },
    
    loc_vars = function(self, info_queue,center)
        return{vars = {center.ability.extra.X_mult, center.ability.extra.modd}} 
    end,
    
    calculate = function(self,card,context)
 

        if context.joker_main then 

            if G.GAME.current_round.current_hand.handname == "Flush" then  

                card.ability.extra.X_mult = card.ability.extra.X_mult + card.ability.extra.modd
    
            elseif G.GAME.current_round.current_hand.handname ==  "Straight" then

                card.ability.extra.X_mult = math.max(card.ability.extra.X_mult - card.ability.extra.modd)
            
            end


            return{
                Xmult_mod = card.ability.extra.X_mult,
                message = 'X' .. card.ability.extra.X_mult,
                colour = G.C.MULT 
            }
        
        end


    end

    in_pool = function(self,wawa,wawa2)
        return true
    end,
}

-----------------------------------------------------------
------------------------MOD CODE END-----------------------
----------------------Taylien-STINKS-----------------------

