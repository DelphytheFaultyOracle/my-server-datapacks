#start / id player
scoreboard players add @s ids 0
execute if score @s ids matches 0 run scoreboard players add count ids 1
execute if score @s ids matches 0 run scoreboard players operation @s ids = count ids

scoreboard players add @s camera_active 1
execute if score @s camera_active matches 2.. run scoreboard players set @s camera_active 0
#give player role
execute if entity @s[team=!] run scoreboard players add @s camera_role 0
execute if entity @s[team=admin] run scoreboard players set @s camera_role 1
execute if entity @s[team=mod] run scoreboard players set @s camera_role 2
execute if entity @s[team=member] run scoreboard players set @s camera_role 3
#if activated
execute if score @s camera_active matches 1 run summon minecraft:armor_stand ~ ~ ~ {"Tags":["cam"],"NoGravity":1b,"Invisible":1b,"Invulnerable":1b}
execute if score @s camera_active matches 1 store result score @e[tag=cam,limit=1,sort=nearest] ids run scoreboard players get @s ids
execute if score @s camera_active matches 1 run gamemode spectator @s
execute if score @s camera_active matches 1 run team join camera @s
execute if score @s camera_active matches 1 run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 10 2
execute if score @s camera_active matches 1 run tellraw @s {"text":"Camera Mode Activated","color":"gray"}
#if deactivated
execute if score @s camera_active matches 0 at @s as @e[tag=cam] if score @s ids = @p ids run tp @p @s
execute if score @s camera_active matches 0 at @s as @e[tag=cam] if score @s ids = @p ids run kill @s
execute if score @s camera_active matches 0 run gamemode survival @s
execute if score @s camera_active matches 0 if score @s camera_role matches 1 run team join admin
execute if score @s camera_active matches 0 if score @s camera_role matches 2 run team join mod
execute if score @s camera_active matches 0 if score @s camera_role matches 3 run team join member
execute if score @s camera_active matches 0 if score @s camera_role matches 0 run team leave @s
execute if score @s camera_active matches 0 run playsound minecraft:block.stone_button.click_on master @s ~ ~ ~ 10 2
execute if score @s camera_active matches 0 run tellraw @s {"text":"Camera Mode Deactivated","color":"gray"}