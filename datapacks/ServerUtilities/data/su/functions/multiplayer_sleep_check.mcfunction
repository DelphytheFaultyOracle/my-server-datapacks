execute as @a if score @s sleep_active matches 1.. run time set 24000t

execute as @a if predicate su:is_thundering if score @s sleep_active matches 1.. run weather clear 3d

execute as @a if score @s sleep_active matches 1.. run scoreboard players set @s sleep_active 0