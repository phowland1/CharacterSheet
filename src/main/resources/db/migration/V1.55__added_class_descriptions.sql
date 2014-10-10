ALTER TABLE `charactersheet`.`classmodel`
ADD COLUMN `description` LONGTEXT NULL DEFAULT NULL AFTER `name`;

UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='1';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='2';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='3';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='4';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='5';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='6';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='7';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='8';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='9';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='10';
UPDATE `charactersheet`.`classmodel` SET `description`='' WHERE `id`='11';
# UPDATE `charactersheet`.`classmodel` SET `description`='Clad in the silver robes that denote her station, an elf closes her eyes to shut out the distractions of the battlefield and begins her quiet chant. Fingers weaving in front of her, she completes her spell and launches a tiny bead of fire toward the enemy ranks, where it erupts into a conflagration that engulfs the soldiers. /nChecking and rechecking his work, a human scribes an intricate magic circle in chalk on the bare stone floor, then sprinkles powdered iron along every line and graceful curve. When the circle is complete, he drones a long incantation. A hole opens in space inside the circle, bringing a whiff of brimstone from the otherworldly plane beyond. /nCrouching on the floor in a dungeon intersection, a gnome tosses a handful of small bones inscribed with mystic symbols, muttering a few words of power over them. Closing his eyes to see the visions more clearly, he nods slowly, then opens his eyes and points down the passage to his left. /nWizards are supreme magic-users, defined and united as a class by the spells they cast. Drawing on the subtle weave of magic that permeates the cosmos, wizards cast spells of explosive fire, arcing lightning, subtle deception, and brute-force mind control. Their magic conjures monsters from other planes of existence, glimpses the future, or turns slain foes into zombies. Their mightiest spells change one substance into another, call meteors down from the sky, or open portals to other worlds. /titleScholars of the Arcane/title Wild and enigmatic, varied in form and function, the power of magic draws students who seek to master its mysteries. Some aspire to become like the gods, shaping reality itself. Though the casting of a typical spell requires merely the utterance of a few strange words, fleeting gestures, and sometimes a pinch or clump of exotic materials, these surface components barely hint at the expertise attained after years of apprenticeship and countless hours of study. /nWizards live and die by their spells. Everything else is secondary. They learn new spells as they experiment and grow in experience. They can also learn them from other wizards, from ancient tomes or inscriptions, and from ancient creatures (such as the fey) that are steeped in magic. /titleThe Lure of Knowledge/title Wizards’ lives are seldom mundane. The closest a wizard is likely to come to an ordinary life is working as a sage or lecturer in a library or university, teaching others the secrets of the multiverse. Other wizards sell their services as diviners, serve in military forces, or pursue lives of crime or domination. /nBut the lure of knowledge and power calls even the most unadventurous wizards out of the safety of their libraries and laboratories and into crumbling ruins and lost cities. Most wizards believe that their counterparts in ancient civilizations knew secrets of magic that have been lost to the ages, and discovering those secrets could unlock the path to a power greater than any magic available in the present age. /titleCreating a Wizard/title Creating a wizard character demands a backstory dominated by at least one extraordinary event. How did your character first come into contact with magic? How did you discover you had an aptitude for it? Do you have a natural talent, or did you simply study hard and practice incessantly? Did you encounter a magical creature or an ancient tome that taught you the basics of magic? /nWhat drew you forth from your life of study? Did your first taste of magical knowledge leave you hungry for more? Have you received word of a secret repository of knowledge not yet plundered by any other wizard? Perhaps you’re simply eager to put your newfound magical skills to the test in the face of danger. /stQuick Build/st You can make a wizard quickly by following these suggestions. First, Intelligence should be your highest ability score, followed by Constitution or Dexterity. If you plan to join the School of Enchantment, make Charisma your next-best score. Second, choose the sage background. Third, choose the mage hand, light, and ray of frost cantrips, along with the following 1st-level spells for your spellbook: burning hands, charm person, feather fall, mage armor, magic missile, and sleep. /stClass Features/st As a wizard, you gain the following class features. /stHit Points/st /bHit Dice:/b 1d6 per wizard level /bHit Points at 1st Level:/b 6 + your Constitution modifier /bHit Points at Higher Levels:/b 1d6 (or 4) + your Constitution modifier per wizard level after 1st /stProficiencies/st /bArmor:/b None /bWeapons:/b Daggers, darts, slings, quarterstaffs, light crossbows /bTools:/b None /bSaving Throws:/b Intelligence, Wisdom /bSkills:/b Choose two from Arcana, History, Insight, Investigation, Medicine, and Religion /stEquipment/st You start with the following equipment, in addition to the equipment granted by your background: /bullets• (a) a quarterstaff or (b) a dagger /bt• (a) a component pouch or (b) an arcane focus /bt• (a) a scholar’s pack or (b) an explorer’s pack /bt• A spellbook/bullets /titleSpellcasting/title As a student of arcane magic, you have a spellbook containing spells that show the first glimmerings of your true power. See chapter 10 for the general rules of spellcasting and chapter 11 for the wizard spell list. /stCantrips/st At 1st level, you know three cantrips of your choice from the wizard spell list. You learn additional wizard cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Wizard table. /stSpellbook/st At 1st level, you have a spellbook containing six 1st-level wizard spells of your choice. /stPreparing and Casting Spells/st The Wizard table shows how many spell slots you have to cast your spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell’s level or higher. You regain all expended spell slots when you finish a long rest. /nYou prepare the list of wizard spells that are available for you to cast. To do so. choose a number of wizard spells from your spellbook equal to your Intelligence modifier + your wizard level (minimum of one spell). The spells must be of a level for which you have spell slots. /nFor example, if you''re a 3rd-level wizard, you have four 1st-level and two 2nd-level spell slots. With an Intelligence of 16, your list of prepared spells can include six spells of 1st or 2nd level, in any combination, chosen from your spellbook. If you prepare the 1st-level spell magic missile, you can cast it using a 1st-level or a 2nd-level slot. Casting the spell doesn’t remove it from your list of prepared spells. /nYou can change your list of prepared spells when you finish a long rest. Preparing a new list of wizard spells requires time spent studying your spellbook and memorizing the incantations and gestures you must make to cast the spell: at least 1 minute per spell level for each spell on your list. Spellcasting Ability Intelligence is your spellcasting ability for your wizard spells, since you learn your spells through dedicated study and memorization. You use your Intelligence whenever a spell refers to your spellcasting ability. In addition, you use your Intelligence modifier when setting the saving throw DC for a wizard spell you cast and when making an attack roll with one. /center/bSpell save DC = 8/b + your proficiency bonus + your Intelligence modifier /bSpell attack modifier =/b your proficiency bonus + your intelligence modifier/center /stRitual Casting/st You can cast a wizard spell as a ritual if that spell has the ritual tag and you have the spell in your spellbook. You don''t need to have the spell prepared. /stSpell casting Focus/st You can use an arcane focus (found in chapter 5) as a spellcasting focus for your wizard spells. /stLearning Spells of 1st Level and Higher/st Each time you gain a wizard level, you can add two wizard spells of your choice to your spellbook. Each of these spells must be of a level for which you have spell slots, as shown on the Wizard table. On your adventures, you might find other spells that you can add to your spellbook (see the “Your Spellbook” sidebar). /titleArcane Recovery/title You have learned to regain some of your magical energy by studying your spellbook. Once per day when you finish a short rest, you can choose expended spell slots to recover. The spell slots can have a combined level that is equal to or less than half your wizard level (rounded up), and none of the slots can be 6th level or higher. /nFor example, if you’re a 4th-level wizard, you can recover up to two levels worth of spell slots. You can recover either a 2nd-level spell slot or two 1st-level spell slots. /titleArcane Tradition/title When you reach 2nd level, you choose an arcane tradition, shaping your practice of magic through one of eight schools: Abjuration, Conjuration, Divination, Enchantment, Evocation, Illusion, Necromancy, or Transmutation, all detailed at the end of the class description. /nYour choice grants you features at 2nd level and again at 6th, 10th, and 14th level. /titleAbility Score Improvement/title When you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability s cores of your choice by 1. As normal, you can’t increase an ability score above 20 using this feature. /titleSpell Mastery/title At 18th level, you have achieved such mastery over certain spells that you can cast them at will. Choose a 1st-level wizard spell and a 2nd-level wizard spell that are in your spellbook. You can cast those spells at their lowest level without expending a spell slot when you have them prepared. If you want to cast either spell at a higher level, you must expend a spell slot as normal. /nBy spending 8 hours in study, you can exchange one or both of the spells you chose for different spells of the same levels. /titleSignature Spells/title When you reach 20th level, you gain mastery over two powerful spells and can cast them with little effort. Choose two 3rd-level wizard spells in your spellbook as your signature spells. You always have these spells prepared, they don’t count against the number of spells you have prepared, and you can cast each of them once at 3rd level without expending a spell slot. W hen you do so, you can’t do so again until you finish a short or long rest. If you want to cast either spell at a higher level, you must expend a spell slot as normal. /title2Arcane Traditions/title2 The study of wizardry is ancient, stretching back to the earliest mortal discoveries of magic. It is firmly established in the worlds of D&D, with various traditions dedicated to its complex study. /nThe most common arcane traditions in the multiverse revolve around the schools of magic. Wizards through the ages have cataloged thousands of spells, grouping them into eight categories called schools, as described in chapter 10. In some places, these traditions are literally schools; a wizard might study at the School of Illusion while another studies across town at the School of Enchantment. In other institutions, the schools are more like academic departments, with rival faculties competing for students and funding. Even wizards who train apprentices in the solitude of their own towers use the division of magic into schools as a learning device, since the spells of each school require mastery of different techniques. /titleSchool of Abjuration/title The School of Abjuration emphasizes magic that blocks, banishes, or protects. Detractors of this school say that its tradition is about denial, negation rather than positive assertion. You understand, however, that ending harmful effects, protecting the weak, and banishing evil influences is anything but a philosophical void. It is a proud and respected vocation. /nCalled abjurers, members of this school are sought when baleful spirits require exorcism, when important locations must be guarded against magical spying, and when portals to other planes of existence must be closed. Abjuration Savant Beginning when you select this school at 2nd level, the gold and time you must spend to copy an abjuration spell into your spellbook is halved. /stArcane Ward/st Starting at 2nd level, you can weave magic around yourself for protection. When you cast an abjuration spell of 1st level or higher, you can simultaneously use a strand of the spell’s magic to create a magical ward on yourself that lasts until you finish a long rest. The ward has hit points equal to twice your wizard level + your Intelligence modifier. Whenever you take damage, the ward takes the damage instead. If this damage reduces the ward to 0 hit points, you take any remaining damage. /nWhile the ward has 0 hit points, it can’t absorb damage, but its magic remains. Whenever you cast an abjuration spell of 1st level or higher, the ward regains a number of hit points equal to twice the level of the spell. /nOnce you create the ward, you can''t create it again until you finish a long rest. /stProjected Ward/st Starting at 6th level, when a creature that you can see within 30 feet of you takes damage, you can use your reaction to cause your Arcane Ward to absorb that damage. If this damage reduces the w ard to 0 hit points, the warded creature takes any remaining damage. /stImproved Abjuration/st Beginning at 10th level, when you cast an abjuration spell that requires you to make an ability check as a part of casting that spell (as in counterspell and dispel magic), you add your proficiency bonus to that ability check. /stSpell Resistance/st Starting at 14th level, you have advantage on saving throws against spells. /nFurthermore, you have resistance against the damage of spells. /titleSchool of Conjuration/title As a conjurer, you favor spells that produce objects and creatures out of thin air. You can conjure billowing clouds of killing fog or summon creatures from elsewhere to fight on your behalf. As your mastery grows, you learn spells of transportation and can teleport yourself across vast distances, even to other planes of existence, in an instant. /stConjuration Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy a conjuration spell into your spellbook is halved. /stMinor Conjuration/st Starting at 2nd level when you select this school, you can use your action to conjure up an inanimate object in your hand or on the ground in an unoccupied space that you can see within 10 feet of you. This object can be no larger than 3 feet on a side and weigh no more than 10 pounds, and its form must be that of a nonmagical object that you have seen. The object is visibly magical, radiating dim light out to 5 feet. /nThe object disappears after 1 hour, when you use this feature again, or if it takes any damage. /stBenign Transposition/st Starting at 6th level, you can use your action to teleport up to 30 feet to an unoccupied space that you can see. Alternatively, you can choose a space within range that is occupied by a Small or M edium creature. If that creature is willing, you both teleport, swapping places. /nOnce you use this feature, you can’t use it again until you finish a long rest or you cast a conjuration spell of 1st level or higher. /stFocused Conjuration/st Beginning at 10th level, while you are concentrating on a conjuration spell, your concentration can’t be broken as a result of taking damage. /stDurable Summons/st Starting at 14th level, any creature that you summon or create with a conjuration spell has 30 temporary hit points. /titleSchool of Divination/title The counsel of a diviner is sought by royalty and commoners alike, for all seek a clearer understanding of the past, present, and future. As a diviner, you strive to part the veils of space, time, and consciousness so that you can see clearly. You work to master spells of discernment, remote viewing, supernatural knowledge, and foresight. /stDivination Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy a divination spell into your spellbook is halved. /stPortent/st Starting at 2nd level when you choose this school, glimpses of the future begin to press in on your awareness. When you finish a long rest, roll two d20s and record the numbers rolled. You can replace any attack roll, saving throw, or ability check made by you or a creature that you can see with one of these foretelling rolls. You must choose to do so before the roll, and you can replace a roll in this way only once per turn. /nEach foretelling roll can be used only once. When you finish a long rest, you lose any unused foretelling rolls. /stExpert Divination/st Beginning at 6th level, casting divination spells comes so easily to you that it expends only a fraction of your spellcasting efforts. When you cast a divination spell of 2nd level or higher using a spell slot, you regain one expended spell slot. The slot you regain must be of a level lower than the spell you cast and can’t be higher than 5th level. /stThe Third Eye/st Starting at 10th level, you can use your action to increase your powers of perception. When you do so, choose one of the following benefits, which lasts until you are incapacitated or you take a short or long rest. You can’t use the feature again until you finish a rest. /n/bDarkvision./b You gain darkvision out to a range of 60 feet, as described in chapter 8. /n/bEthereal Sight./b You can see into the Ethereal Plane within 60 feet of you. /n/bGreater Comprehension./b You can read any language. /n/bSee Invisibility./b You can see invisible creatures and objects within 10 feet of you that are within line of sight. /stGreater Portent/st Starting at 14th level, the visions in your dreams intensify and paint a more accurate picture in your mind of what is to come. You roll three d20s for your Portent feature, rather than two. /titleSchool of Enchantment/title As a member of the School of Enchantment, you have honed your ability to magically entrance and beguile other people and monsters. Some enchanters are peacemakers w ho bewitch the violent to lay down their arms and charm the cruel into showing mercy. Others are tyrants w ho magically bind the unwilling into their service. Most enchanters fall somewhere in between. /stEnchantment Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy an enchantment spell into your spellbook is halved. /stHypnotic Gaze/st Starting at 2nd level when you choose this school, your soft words and enchanting gaze can magically enthrall another creature. A s an action, choose one creature that you can see within 5 feet of you. If the target can see or hear you, it must succeed on a Wisdom saving throw against your wizard spell save DC or be charmed by you until the end of your next turn. The charmed creature’s speed drops to 0, and the creature is incapacitated and visibly dazed. /nOn subsequent turns, you can use your action to maintain this effect, extending its duration until the end of your next turn. However, the effect ends if you move more than 5 feet away from the creature, if the creature can neither see nor hear you, or if the creature takes damage. /nOnce the effect ends, or if the creature succeeds on its initial saving throw against this effect, you can’t use this feature on that creature again until you finish a long rest. /stInstinctive Charm/st Beginning at 6th level, when a creature you can see within 30 feet of you makes an attack roll against you, you can use your reaction to divert the attack, provided that another creature is within the attack’s range. The attacker must make a W isdom saving throw against your wizard spell save DC. On a failed save, the attacker must target the creature that is closest to it, not including you or itself. If multiple creatures are closest, the attacker chooses which one to target. On a successful save, you can’t use this feature on the attacker again until you finish a long rest. /nYou must choose to use this feature before knowing whether the attack hits or misses. Creatures that can’t be charmed are immune to this effect. /stSplit Enchantment/st Starting at 10th level, when you cast an enchantment spell of 1st level or higher that targets only one creature, you can have it target a second creature. /stAlter Memories/st At 14th level, you gain the ability to make a creature unaware of your magical influence on it. When you cast an enchantment spell to charm one or more creatures, you can alter one creature’s understanding so that it remains unaware of being charmed. /nAdditionally, once before the spell expires, you can use your action to try to make the chosen creature forget some of the time it spent charmed. The creature must succeed on an Intelligence saving throw against your wizard spell save DC or lose a number of hours of its memories equal to 1 + your Charisma modifier (minimum 1). You can make the creature forget less time, and the amount of time can’t exceed the duration of your enchantment spell. /titleSchool of Evocation/title You focus your study on magic that creates powerful elemental effects such as bitter cold, searing flame, rolling thunder, crackling lightning, and burning acid. Some evokers find employment in military forces, serving as artillery to blast enemy armies from afar. Others use their spectacular power to protect the weak, while some seek their own gain as bandits, adventurers, or aspiring tyrants. /stEvocation Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy an evocation spell into your spellbook is halved. /stSculpt Spells/st Beginning at 2nd level, you can create pockets of relative safety within the effects of your evocation spells. When you cast an evocation spell that affects other creatures that you can see, you can choose a number of them equal to 1 + the spell’s level. The chosen creatures automatically succeed on their saving throws against the spell, and they take no damage if they would normally take half damage on a successful save. /stPotent Cantrip/st Starting at 6th level, your damaging cantrips affect even creatures that avoid the brunt of the effect. When a creature succeeds on a saving throw against your cantrip, the creature takes half the cantrip’s damage (if any) but suffers no additional effect from the cantrip. /stEmpowered Evocation/st Beginning at 10th level, you can add your Intelligence modifier to the damage roll of any wizard evocation spell you cast. /stOverchannel/st Starting at 14th level, you can increase the power of your simpler spells. When you cast a wizard spell of 5th level or lower that deals damage, you can deal maximum damage with that spell. /nThe first time you do so, you suffer no adverse effect. If you use this feature again before you finish a long rest, you take 2d12 necrotic damage for each level of the spell, immediately after you cast it. Each time you use this feature again before finishing a long rest, the necrotic damage per spell level increases by 1d12. This damage ignores resistance and immunity. /titleSchool of Illusion/title You focus your studies on magic that dazzles the senses, befuddles the mind, and tricks even the wisest folk. Your magic is subtle, but the illusions crafted by your keen mind make the impossible seem real. Some illusionists—including many gnome wizards—are benign tricksters w ho use their spells to entertain. Others are more sinister masters of deception, using their illusions to frighten and fool others for their personal gain. /stIllusion Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy an illusion spell into your spellbook is halved. /stImproved Minor Illusion/st When you choose this school at 2nd level, you learn the minor illusion cantrip. If you already know this cantrip, you learn a different wizard cantrip of your choice. The cantrip doesn’t count against your number of cantrips known. When you cast minor illusion, you can create both a sound and an image with a single casting of the spell. /stMalleable Illusions/st Starting at 6th level, when you cast an illusion spell that has a duration of 1 minute or longer, you can use your action to change the nature of that illusion (using the spell’s normal parameters for the illusion), provided that you can see the illusion. /stIllusory Self/st Beginning at 10th level, you can create an illusory duplicate of yourself as an instant, almost instinctual reaction to danger. When a creature makes an attack roll against you, you can use your reaction to interpose the illusory duplicate between the attacker and yourself. The attack automatically m isses you, then the illusion dissipates. /nOnce you use this feature, you can’t use it again until you finish a short or long rest. /stIllusory Reality/st By 14th level, you have learned the secret of weaving shadow magic into your illusions to give them a semireality. When you cast an illusion spell of 1st level or higher, you can choose one inanimate, nonmagical object that is part of the illusion and make that object real. You can do this on your turn as a bonus action while the spell is ongoing. The object remains real for 1 minute. For example, you can create an illusion of a bridge over a chasm and then make it real long enough for your allies to cross. /nThe object can’t deal damage or otherwise directly harm anyone. /titleSchool of Necromancy/title The School of Necromancy explores the cosmic forces of life, death, and undeath. As you focus your studies in this tradition, you learn to manipulate the energy that animates all living things. As you progress, you learn to sap the life force from a creature as your magic destroys its body, transforming that vital energy into magical power you can manipulate. /nMost people see necromancers as menacing, or even villainous, due to the close association with death. Not all necromancers are evil, but the forces they manipulate are considered taboo by many societies. /stNecromancy Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy a necromancy spell into your spellbook is halved. /stGrim Harvest/st At 2nd level, you gain the ability to reap life energy from creatures you kill with your spells. Once per turn when you kill one or more creatures with a spell of 1st level or higher, you regain hit points equal to twice the spell’s level, or three times its level if the spell belongs to the School of Necromancy. You don’t gain this benefit for killing constructs or undead. /stUndead Thralls/st At 6th level, you add the animate dead spell to your spellbook if it is not there already. When you cast animate dead, you can target one additional corpse or pile of bones, creating another zombie or skeleton, as appropriate. /nWhenever you create an undead using a necromancy spell, it has additional benefits: /bullets• The creature’s hit point maximum is increased by an amount equal to your wizard level. /bt• The creature adds your proficiency bonus to its weapon damage rolls./bullets /stInured to Undeath/st Beginning at 10th level, you have resistance to necrotic damage, and your hit point maximum can''t be reduced. You have spent so much time dealing with undead and the forces that animate them that you have become inured to some of their worst effects. /stCommand Undead/st Starting at 14th level, you can use magic to bring undead under your control, even those created by other wizards. As an action, you can choose one undead that you can see within 60 feet of you. That creature must make a Charisma saving throw against your wizard spell save DC. If it succeeds, you can’t use this feature on it again. If it fails, it becomes friendly to you and obeys your commands until you use this feature again. /nIntelligent undead are harder to control in this way. If the target has an Intelligence of 8 or higher, it has advantage on the saving throw. If it fails the saving throw and has an Intelligence of 12 or higher, it can repeat the saving throw at the end of every hour until it succeeds and breaks free. /titleSchool of Transmutation/title You are a student of spells that modify energy and matter. To you, the world is not a fixed thing, but eminently mutable, and you delight in being an agent of change. You wield the raw stuff of creation and learn to alter both physical forms and mental qualities. Your m agic gives you the tools to become a smith on reality’s forge. /nSome transmuters are tinkerers and pranksters, turning people into toads and transforming copper into silver for fun and occasional profit. Others pursue their magical studies with deadly seriousness, seeking the power of the gods to make and destroy worlds. /stTransmutation Savant/st Beginning when you select this school at 2nd level, the gold and time you must spend to copy a transmutation spell into your spellbook is halved. /stMinor Alchemy/st Starting at 2nd level when you select this school, you can temporarily alter the physical properties of one nonmagical object, changing it from one substance into another. You perform a special alchemical procedure on one object composed entirely of wood, stone (but not a gemstone), iron, copper, or silver, transforming it into a different one of those materials. For each 10 minutes you spend performing the procedure, you can transform up to 1 cubic foot of material. After 1 hour, or until you lose your concentration (as if you w ere concentrating on a spell), the material reverts to its original substance. /stTransmuter’s Stone/st Starting at 6th level, you can spend 8 hours creating a transmuter’s stone that stores transmutation magic. You can benefit from the stone yourself or give it to another creature. A creature gains a benefit of your choice as long as the stone is in the creature’s possession. When you create the stone, choose the benefit from the following options: /bullets• Darkvision out to a range of 60 feet, as described in chapter 8 /bt• An increase to speed of 10 feet while the creature is unencumbered /bt• Proficiency in Constitution saving throws /bt• Resistance to acid, cold, fire, lightning, or thunder damage (your choice whenever you choose this benefit)/bullets Each time you cast a transmutation spell of 1st level or higher, you can change the effect of your stone if the stone is on your person. /nIf you create a new transmuter’s stone, the previous one ceases to function. /stShapechanger/st At 10th level, you add the polymorph spell to your spellbook, if it is not there already. You can cast polymorph without expending a spell slot. When you do so, you can target only yourself and transform into a beast w hose challenge rating is 1 or lower. /nOnce you cast polymorph in this way, you can’t do so again until you finish a short or long rest, though you can still cast it normally using an available spell slot. /stMaster Transmuter/st Starting at 14th level, you can use your action to consume the reserve of transmutation magic stored within your transmuter’s stone in a single burst. When you do so, choose one of the following effects. Your transmuter’s stone is destroyed and can’t be remade until you finish a long rest. /n/bMajor Transformation./b You can transmute one nonmagical object—no larger than a 5-foot cube—into another nonmagical object of similar size and mass and of equal or lesser value. You must spend 10 minutes handling the object to transform it. /n/bPanacea./b You remove all curses, diseases, and poisons affecting a creature that you touch with the transmuter’s stone. The creature also regains all its hit points. /n/bRestore Life./b You cast the raise dead spell on a creature you touch with the transmuter’s stone, without expending a spell slot or needing to have the spell in your spellbook. /n/bRestore Youth./b You touch the transmuter’s stone to a willing creature, and that creature’s apparent age is reduced by 3d10 years, to a minimum of 13 years. This effect doesn’t extend the creature’s lifespan.' WHERE `id`='12';

CREATE TABLE `charactersheet`.`charactermodel_preparedspells` (
  `character_id` BIGINT(20) NULL,
  `spellmodel_id` BIGINT(20) NULL,
  INDEX `character_id_fk_idx` (`character_id` ASC),
  INDEX `spell_id_fk_idx` (`spellmodel_id` ASC),
  CONSTRAINT `character_id_fk`
  FOREIGN KEY (`character_id`)
  REFERENCES `charactersheet`.`charactermodel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `spell_id_fk`
  FOREIGN KEY (`spellmodel_id`)
  REFERENCES `charactersheet`.`spellmodel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

UPDATE `charactersheet`.`classmodel` SET `magic_ability`='Intel' WHERE `id`='12';

UPDATE `charactersheet`.`modifyabilitytrait` SET `ability`='Intel' WHERE `id`='4';
UPDATE `charactersheet`.`modifyabilitytrait` SET `ability`='Intel' WHERE `id`='10';
