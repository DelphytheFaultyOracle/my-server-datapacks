#give player id if they don't have one
scoreboard players add @s ids 0
execute if score @s ids matches 0 run scoreboard players add count ids 1
execute if score @s ids matches 0 run scoreboard players operation @s ids = count ids

#delete old armor_stand
execute at @s as @e[tag=sh] if score @s ids = @p ids run tag @s add del
#check if other taggged armor_stands in chunk
execute at @s as @e[tag=sh] if score @s ids = @p ids at @s as @e[tag=sh,tag=!del] if score @e[tag=del,limit=1,sort=nearest] chunk_x = @s chunk_x if score @e[tag=del,limit=1,sort=nearest] chunk_z = @s chunk_z run scoreboard players set @e[tag=del,limit=1,sort=nearest] chunk_found 1
execute at @s as @e[tag=back] if score @s ids = @p ids at @s as @e[tag=back,tag=!del] if score @e[tag=del,limit=1,sort=nearest] chunk_x = @s chunk_x if score @e[tag=del,limit=1,sort=nearest] chunk_z = @s chunk_z run scoreboard players set @e[tag=del,limit=1,sort=nearest] chunk_found 1
#unload chunk if not other tagged armor_stands
execute at @s as @e[tag=sh] if score @s ids = @p ids if score @s chunk_found matches 0 at @s run forceload remove ~ ~
execute at @s as @e[tag=sh] if score @s ids = @p ids if score @s chunk_found matches 1 run scoreboard players set @s chunk_found 0
execute at @s as @e[tag=sh] if score @s ids = @p ids run kill @s

# create new armor_stand
summon minecraft:armor_stand ~ ~ ~ {"Tags":["sh"],"NoGravity":1b,"Invulnerable":1b,"Invisible":1b}
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s ids = @p ids
#center x
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result score @s chunk_ops run data get entity @s Pos[0] 1
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_ops *= scale chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_ops += offset chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result storage chunk x double 0.1 run scoreboard players get @s chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] run data modify entity @s Pos[0] set from storage chunk x
#center z
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result score @s chunk_ops run data get entity @s Pos[2] 1
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_ops *= scale chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_ops += offset chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result storage chunk z double 0.1 run scoreboard players get @s chunk_ops
execute at @s as @e[tag=sh,limit=1,sort=nearest] run data modify entity @s Pos[2] set from storage chunk z
#load chunk and add armor_stand to found scoreboard
execute at @s as @e[tag=sh,limit=1,sort=nearest] at @s run forceload add ~ ~
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players add @s chunk_found 0

#find and save current chunk
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result score @s chunk_x run data get entity @s Pos[0]
execute at @s as @e[tag=sh,limit=1,sort=nearest] store result score @s chunk_z run data get entity @s Pos[2]
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_x /= div chunk_x
execute at @s as @e[tag=sh,limit=1,sort=nearest] run scoreboard players operation @s chunk_z /= div chunk_z

#user feedback
execute as @s at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 10 1
execute as @s at @s run tellraw @s {"text":"Home Set","color":"green"}