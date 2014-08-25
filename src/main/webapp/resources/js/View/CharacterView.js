define("CharacterView",
    ["jquery", "underscore", "marionette", "CharacterModel", 'jqueryUi', 'epoxy', 'AbilitiesView', 'CoinPurseView'],
    function($, _, marionette, CharacterModel, jqueryUi, epoxy, AbilitiesView, CoinPurseView){
        var view = marionette.ItemView.extend({
            el: '#character-sheet',
            model: null,
            skillsAllowed: 0,
            languagesAllowed: 0,
            character: null,
            maxAbilityPoints: 27,
            maxAbilityScore: 15,
            minAbilityScore: 8,
            abilityPoints: 27,
            abilityScoreText: 'Ability Points: ',

            abilitiesView: null,
            coinPurseView: null,

            ui:{
                id: '#characterId',
                name: '#name',
                race: '#race',
                clazz: '#class-select',
                level: '#level',
                ac: '#armor-class',
                maxHealth: '#maxHealth',
                currentHealth: '#currentHealth',
                str: '#Str',
                dex: '#Dex',
                con: '#Con',
                conMod: '#ConMod',
                int: '#Int',
                intMod: '#IntMod',
                wis: '#Wis',
                cha: '#Cha',
                skillProficiencies: '#skillProfs',
                toolProficiencies: '#toolProfs',
                weaponProficiencies: '#weaponProfs',
                armorProficiencies: '#armorProfs',
                saveProficiencies: '#saveProfs',
                languages: '#languages',
                skillSelectLabel: '#skill-select-label',
                languageModal: '#language-modal',
                languageSubmit: '#language-submit',
                abilityPointLabel: '#ability-point-label',
                abilityScoreReset: '#ability-score-reset',
                startingWealthLabel: '#starting-wealth-label',
                copperInput: '#money-copper',
                silverInput: '#money-silver',
                electrumInput: '#money-electrum',
                goldInput: '#money-gold',
                platinumInput: '#money-platinum',
                storeLink: '#store-link',
                storeSubmit: '#store-submit',
                clearInventory: '#clear-inventory',
                equipMain: '#main-select',
                equipOff: '#off-select',
                equipArmor: '#armor-select',
                storeWeaponTable: '#weapon-inventory-table',
                storeArmorTable: '#armor-inventory-table',
                subrace: '#subrace',
                encumberedLabel: '#encumbered-label',
                speed: '#speed'

            },

            bindings:{
                '#armor-class': 'value:armorClass',
                '#maxHealth': 'value:maxHealth',
                '#currentHealth': 'value:currentHealth'
            },

            events:{
                'change @ui.clazz': 'onClassChange',
                'change @ui.race' : 'onRaceChange',
                'click .ability-change': 'onAbilityChangeButtonClick',
                'click @ui.languageSubmit' : 'onLanguageSubmitClick',
                'click @ui.abilityScoreReset': 'onAbilityScoreResetClick',
                'click @ui.storeLink': 'onStoreLinkClick',
                'click @ui.clearInventory': 'onClearLinkClick',
                'change @ui.equipMain': 'onEquipMainChange',
                'change @ui.equipOff': 'onEquipOffChange',
                'change @ui.equipArmor': 'onEquipArmorChange',
                'change @ui.subrace' : 'onSubraceChange',
                'click @ui.storeSubmit': 'onStoreSubmitClick'
            },

            onRender: function(){
                this.setCharacter();
                this.listenTo(this.model, CharacterModel.Event_CharacterUpdated, _.bind(this.refreshCharacter, this));
            },

            refreshCharacter: function(){
                for (var key in this.model.changed) {
                    switch(key){
                        case 'languages':
                            this.setLanguagesAllowed();
                            this.setLanguageTable();
                            this.setLanguageSelectionLink();
                            break;
                        case 'proficiencies':
                            this.setProficiencies();
                            this.setSkillProficienciesOptions();
                            break;
                        case 'inventory':
                            this.setMainHandOptions();
                            this.setOffHandOptions();
                            this.setArmorOptions();
                            this.setInventory();
                            break;
                        case 'traits':
                            this.setTraits();
                            break;
                        case 'race':
                            this.setSubRaces();
                            break;
                    }
                }
            },

            setCharacter: function(){
                this.model = new CharacterModel({_id: this.ui.id.val()});
                this.applyBindings();
                this.model.fetchModel(_.bind(function(){
                    this.abilitiesView = new AbilitiesView();
                    this.listenTo(this.abilitiesView, AbilitiesView.Event_AbilitiesUpdated, _.bind(this.onAbilitiesUpdated, this));
                    this.abilitiesView.onRender(this.model.get('abilities'));
                    this.showHideAbilityChangeButtons();

                    this.coinPurseView = new CoinPurseView();
                    this.coinPurseView.onRender(this.model.get('coinPurse'));
                }, this));

            },

            setAC: function(){
                if(this.model.get('equippedArmor')){
                    var armor = this.model.get('equippedArmor');
                    var dexMod = this.getAbilityMod(this.ui.dex.val());
                    if(dexMod > armor.maxDexModifier){
                        dexMod = armor.maxDexModifier;
                    }

                    this.ui.ac.val(armor.armorClass + dexMod);
                }
            },

            setTraits: function(){
                for(var i= 0; i< this.model.get('traits'); i++){
                    this.ui.traits.append("<tr><td>" + this.model.get('traits')[i].name + "</td></tr>");
                }
            },

            onClassChange: function(event){
                if($(event.target).val() === '0'){
                    $('.proficiency-row').remove();
                    this.skillsAllowed = 0;
                    this.setSkillProficienciesOptions();
                    this.model.set('clazz', null);
                }else {
                    var data = {
                        'characterId': this.model.get('id') + '',
                        'classId': this.ui.clazz.val() + ''
                    };
                    $.getJSON("class.json", data, _.bind(function (character) {
                        this.model.fetchModel();
                    }, this));
                }
            },

            /// *** Race and Subrace *** ///

            onRaceChange: function(event){
                var data = {
                    'characterId': this.model.get('id') + '',
                    'raceId': this.ui.race.val() + ''
                };
                $.getJSON("race.json", data, _.bind(function () {
                    this.model.fetchModel({success: _.bind(function(data){
                        this.model.fetchModel();
                    },this)});
                }, this));
            },

            onSubraceChange : function(){
                var data = {
                    'characterId': this.model.get('id') + '',
                    'subraceId': this.ui.subrace.val() + ''
                };
                $.getJSON("subrace.json", data, _.bind(function (data) {
                    this.model.fetchModel();
                }, this));

            },

            setSubRaces: function(){
                $('.subrace-option').remove();
                if(this.model.get('race').availableSubraces.length > 0){
                    $(this.model.get('race').availableSubraces).each(_.bind(function(key, value){
                        this.ui.subrace.append('<option class="subrace-option" value="' + value.id + '">' + value.name + '</option>')
                    }, this));
                }
            },

            /// *** Skills and Proficiencies *** ///

            setProficiencies: function(){
                $('.proficiency-row').remove();
                if(this.model.get('race') != null) {
                    this.setRaceProficiencies();
                }
                if(this.model.get('clazz') != null) {
                    this.setClassProficiencies();
                }
            },

            setClassProficiencies: function(){
                this.skillsAllowed = this.model.get('clazz').skillsAtCreation;
                $(this.model.get('clazz').proficiencies).each(_.bind(function(key, value){
                    var $element;
                    switch(value.proficiencyType){
                        case 'SKILL':
                            $element = this.ui.skillProficiencies;
                            break;
                        case 'TOOL':
                            $element = this.ui.toolProficiencies;
                            break;
                        case 'WEAPON':
                            $element = this.ui.weaponProficiencies;
                            break;
                        case 'ARMOR':
                            $element = this.ui.armorProficiencies;
                            break;
                        case 'SAVE':
                            $element = this.ui.saveProficiencies;
                            break;
                    }
                    if(value.proficiencyType === 'SKILL'){
                        $element.append('<tr class="proficiency-row"><td>' + '<input name="proficiencies" class="proficiency skill" type="checkbox" value="' + value.id + '">' + value.name + '</input></td>')
                    }else {
                        $element.append('<tr class="proficiency-row"><td>' +
                            '<input name="proficiencies" type="hidden" value="' + value.id + '">'
                            + value.name + '</input></td>')
                    }
                },this));

                $('.proficiency.skill').on('click', _.bind(this.onSkillCheckboxClick,this));
                this.setSkillProficienciesOptions();
            },

            setRaceProficiencies: function(){
                var proficiencies = []
                $(this.model.get('race').proficiencies).each(_.bind(function(key, value){
                    proficiencies.push(value);
                }, this));
                if(this.model.get('subrace') != null) {
                    $(this.model.get('subrace').proficiencies).each(_.bind(function (key, value) {
                        proficiencies.push(value);
                    }, this));
                }
                $(proficiencies).each(_.bind(function(key, value){
                    var $element;
                    switch(value.proficiencyType){
                        case 'SKILL':
                            $element = this.ui.skillProficiencies;
                            break;
                        case 'TOOL':
                            $element = this.ui.toolProficiencies;
                            break;
                        case 'WEAPON':
                            $element = this.ui.weaponProficiencies;
                            break;
                        case 'ARMOR':
                            $element = this.ui.armorProficiencies;
                            break;
                        case 'SAVE':
                            $element = this.ui.saveProficiencies;
                            break;
                    }
                    $element.append('<tr class="proficiency-row"><td>' +
                        '<input name="proficiencies" type="hidden" value="' + value.id + '">'
                        + value.name + '</input></td>')
                },this))

                $('.proficiency.skill').on('click', _.bind(this.onSkillCheckboxClick,this));
                this.setSkillProficienciesOptions();
            },

            removeProficiencies: function(){
                $('table.proficiencies').each(function(key, value){
                    $(value).remove('.proficiency-row');
                });
            },

            removeLanguages: function(){

            },

            onSkillCheckboxClick: function(event){
                if($(event.target).prop('checked') !== true){
                    this.skillsAllowed++;
                    this.setSkillProficienciesOptions();
                }else {
                    if (this.skillsAllowed > 0) {
                        this.skillsAllowed--;
                        this.setSkillProficienciesOptions()
                    } else {
                        this.setSkillProficienciesOptions();
                    }
                }
            },

            setSkillProficienciesOptions: function(){
                if(this.skillsAllowed > 0){
                    this.ui.skillSelectLabel.text('Choose ' + this.skillsAllowed + ' skill ' + (this.skillsAllowed === 1 ? 'proficiency' : 'proficiencies'));
                }else{
                    this.ui.skillSelectLabel.text('');
                }
                this.enableDisableSkillCheckboxes();
            },

            enableDisableSkillCheckboxes: function(){
                var disabled = this.skillsAllowed > 0;
                $('.proficiency.skill').each(_.bind(function(key, value) {
                    if (!disabled){
                        if($(value).prop('checked')){
                            $(value).removeAttr('disabled');
                        }else{
                            $(value).attr('disabled', 'disabled');
                        }
                    }else{
                        $(value).removeAttr("disabled");
                    }
                }, this));
            },

            /// *** Languages *** ///

            setLanguagesAllowed: function(){
                this.languagesAllowed = this.getAbilityMod(this.ui.int.val()) - $('.language-row').length;
                if(this.model.get('race')){
                    this.languagesAllowed = this.languagesAllowed + this.model.get('race').languages.length;
                }
            },

            setLanguageTable: function(){
                $('.language-row').remove();
                $(this.model.get('languages')).each(_.bind(function(key, value){
                    this.ui.languages.append('<tr class="language-row"><td><input name="languages" type="hidden" value="' + value.id + '">' + value.name + '</input></td>')
                }, this));
            },

            setLanguageSelectionLink: function(){
                $('.language-select-row').remove();
                this.setLanguagesAllowed();
                for(var i=0; i<this.languagesAllowed; i++){
                    $('#languages').append('<tr class="language-select-row"><td><a href="#" ' +
                        'class="language-select" id="language-select_"' + i + '>Select a language</a></td></tr>');
                }
                $('.language-select').on('click', _.bind(this.onLanguageSelectClick, this));
            },

            removeLanguage: function(event){
                $('#language-row-' + $(event.target).prop('id')).remove();
                this.setLanguagesAllowed();
                this.setLanguageSelectionLink();
            },

            onLanguageSelectClick: function(){
                this.modalOpen('language-modal', 'language-modal');
            },

            onLanguageSubmitClick: function(event){
                var language = $("input[name=language-option]:checked").val();
                this.modalClose('language-modal');
                $('#languages').append(
                        '<tr id="language-row-' + language + '" class="language-row"><td><input name="languages"  type="hidden" value="'
                        + language.id + '">' + language + '</input>' + '<a class="minus-sign link-small" id="'
                        + language + '" href="#">Remove</a></td></tr>');
                this.setLanguageSelectionLink();
                $('#' + language).on('click', _.bind(this.removeLanguage, this));
            },

            /// ** Inventory and Store *** ///

            onStoreLinkClick: function(){
                this.modalOpen('store-modal', 'store-modal');
                $('.filter').on('change', _.bind(this.onStoreFilterSelected, this));
            },

            onStoreFilterSelected: function(event){
                var filter = $(event.target).prop('checked') === true ? "true" : "false";
                var data = {
                    characterId: this.model.get('id'),
                    filter: filter
                };
                $.getJSON("filterEquipmentByProficiency.json", data, _.bind(function(data){
                    $('.store-item-row').remove();
                    console.log(data);
                    $(data.data).each(_.bind(function(key, value){
                        if(value.weaponRange){
                            this.addWeaponToStore(value);
                        }else if(value.armorClass){
                            this.addArmorToStore(value);
                        }
                    }, this));
                }, this));
            },

            addWeaponToStore: function(weapon){
                this.ui.storeWeaponTable.append("<tr class='store-item-row'><td><input type='checkbox' name='store-item' class='store-item' id='item_" + weapon.id + "' value='"+
                    weapon.id + "'>" + "<span>"+ weapon.name + "</span></td><td><span>"+ weapon.numberOfDice +  weapon.damageDice.name+ "</span></td>" +
                    "<td><span>" + weapon.price + weapon.priceDenomination.abbr + "</span></td><td><span>" + weapon.itemWeight + "</span></td></tr>");
            },

            addArmorToStore: function(armor){
                var append = "<tr class='store-item-row'><td><input type='checkbox' name='store-item' class='store-item' id='item_" + armor.id+ "' " +
                    "value='" + armor.id+ "'><span>" + armor.name+ "</span></td><td><span>" + armor.armorClass+ "</span></td><td><span>" +
                    armor.strength+ "</span></td><td><span>" + (armor.stealthDisadvantage == true ? 'Yes' : '')+ "</span></td><td><span>" +
                    armor.price+ " " + armor.priceDenomination.abbr+ "</span></td><td><span>" + armor.itemWeight+ "</span></td></tr>";
                this.ui.storeArmorTable.append(append);
            },

            onStoreSubmitClick: function(){
                var items = [];
                $(this.model.get('inventory')).each(function(key, value){
                    items.push(value.id + '');
                });
                $('.store-item').each(_.bind(function(key, value){
                    if($(value).prop('checked') === true) {
                        items.push($(value).val());
                    }
                }, this));

                var data = {charId: this.model.get('id'),
                    equipmentIds: items};

                $.getJSON('equipment.json', "ids=" + JSON.stringify(data), _.bind(function(data){
                    if(data.code === 1) {
                        this.character = data.data;
                        this.refreshCharacter();
                        this.modalClose('store-modal');
                        alert(data.message);
                    }else if(data.code === 0){
                        alert(data.errorMessage);
                    }
                }, this));
            },

            setInventory: function(){
                $('tr.inventory-item').remove();
                $(this.model.get('inventory')).each(_.bind(function(key, value){
                    var item = this.findItemInInventory(value.id);
                    var $element;
                    if(item.maxWeaponRange !== undefined) {
                        $element = this.ui.weaponTable;
                    }else if(item.armorClass !== undefined){
                        $element = this.ui.storeArmorTable;
                    }
                    $element.append('<tr class="inventory-item" ><td><span name="inventory>" value="' + item.id + '">' + item.name + '</span></td></tr>')
                }, this));
                if(this.model.get('encumbered')){
                    this.ui.encumberedLabel.show();
                }else{
                    this.ui.encumberedLabel.hide();
                }
            },

            findItemInInventory: function(id){
                for(var i=0; i < this.model.get('inventory').length; i++){
                    if(this.model.get('inventory')[i].id === id){
                        return this.model.get('inventory')[i];
                    }
                }
            },

            setMainHandOptions: function(){
                $('.main-hand-option').remove();
                $.getJSON('main-hand.json', "characterId=" + this.model.get('id'), _.bind(function(data){
                    $(data).each(_.bind(function(key, value){
                        this.ui.equipMain.append('<option class="main-hand-option" value="' + value.id + '">' + value.name + '</option>')
                    }, this));
                }, this));
            },

            setOffHandOptions: function(){
                $('.off-hand-option').remove();
                $.getJSON('off-hand.json', "characterId=" + this.model.get('id'), _.bind(function(data){
                    $(data).each(_.bind(function(key, value){
                        this.ui.equipOff.append('<option class="off-hand-option" value="' + value.id + '">' + value.name + '</option>')
                    }, this));
                }, this));
            },

            setArmorOptions: function(){
                $('.armor-option').remove();
                $.getJSON('armor.json', "characterId=" + this.model.get('id'), _.bind(function(data){
                    $(data).each(_.bind(function(key, value){
                        this.ui.equipArmor.append('<option class="armor-option" value="' + value.id + '">' + value.name + '</option>')
                    }, this));
                }, this));
            },

            onClearLinkClick: function(){
                var data = {charId: this.model.get('id'),
                    equipmentIds: []};

                $.getJSON('equipment.json', "ids=" + JSON.stringify(data), _.bind(function(data){
                    this.model.fetchModel();
                }, this));
            },

            onEquipMainChange: function(){
                var data = {
                    "characterId": this.model.get('id'),
                    "itemId": this.ui.equipMain.val()
                };
                $.getJSON('equip-main-hand.json', data, _.bind(function(data){
                    this.model.fetchModel();
                }, this));
            },

            onEquipOffChange: function(){
                var data = {
                    "characterId": this.model.get('id'),
                    "itemId": this.ui.equipOff.val()
                };
                $.getJSON('equip-off-hand.json', data, _.bind(function(data){
                    this.model.fetchModel();
                }, this));
            },

            onEquipArmorChange: function(){
                var data = {
                    "characterId": this.model.get('id'),
                    "itemId": this.ui.equipArmor.val()
                };
                $.getJSON('equip-armor.json', data, _.bind(function(){
                    this.model.fetchModel();
                }, this));
            },


            //*** Character Abilities ***//

            onAbilitiesUpdated: function(){
                this.setAbilityMods();
                this.setLanguagesAllowed();
                this.setLanguageSelectionLink();
            },

            onAbilityChangeButtonClick: function(event){
                var ability = $(event.target).prop('id').substr(0,3);
                var $element = $('#' + ability);
                var score = parseInt($element.val());
                var posNeg = $(event.target).prop('id').indexOf('minus') !== -1 ? "negative" : "positive";

                if(posNeg == 'positive'){
                    var newScore = score + 1;
                    var newPointsVal = this.abilitiesView.model.get('abilityPointsRemaining') - this.getAbilityPointCost(newScore);
                    if(newPointsVal < 0 ) return;
                }else{
                    var newScore = score - 1;
                    var newPointsVal = this.abilitiesView.model.get('abilityPointsRemaining') + this.getAbilityPointCost(newScore, true);
                }
                if(this.abilitiesView.model.get('abilityPointsRemaining') === 0){
                    this.ui.abilityPointLabel.text('');
                }else {
                    this.ui.abilityPointLabel.text(this.abilityScoreText + this.abilitiesView.model.get('abilityPointsRemaining'));
                }

                var data = {characterId: this.model.get('id') +'', abilityType: ability, positive : posNeg};
                $.getJSON('change-ability.json', data, _.bind(function(data){
                    this.abilitiesView.setAbilities(data);
                    this.model.fetchModel();
                    this.showHideAbilityChangeButtons();
                }, this));
            },

            showHideAbilityChangeButtons: function(neg){
                $('.ability').each(_.bind(function(key, value){
                    var ability = $(value).prop('id');
                    var placeholder = $('#' + ability + '-placeholder');
                    var plus = $('#' + ability + '-plus');
                    var minus = $('#' + ability + '-minus');
                    var points = $(value).val();

                    if(this.canChangeAbility($(value), true)){
                        plus.show();
                    }else{
                        plus.hide();
                    }

                    if(this.canChangeAbility($(value), false)){
                        minus.show();
                    }else{
                        minus.hide();
                    }
                    if(plus.css('display') === 'none' || minus.css('display') === 'none'){
                        placeholder.addClass('show');
                    }else{
                        placeholder.removeClass('show');
                    }
                }, this))
            },

            canChangeAbility: function(ability, increase){
                var score = increase ? parseInt(ability.val()) + 1 : parseInt(ability.val()) - 1;
                var cost = this.getAbilityPointCost(score, false);
                if(increase){
                    return cost <= this.abilitiesView.model.get('abilityPointsRemaining') && score <= this.maxAbilityScore;
                }else{
                    return cost + this.abilitiesView.model.get('abilityPointsRemaining') <= this.maxAbilityPoints && score >= this.minAbilityScore;
                }
            },

            setAbilityMods: function(){
                $('.ability').each(_.bind(function(key, value){
                    var mod = this.getAbilityMod($(value).val());
                    mod = (mod >= 0) ? (' + ' + mod) : (' - ' + Math.abs(mod));
                    $('#'+$(value).attr('id') + "Mod").prop('textContent', mod);
                },this));
            },

            getAbilityMod: function(score){
                return (parseInt(score) === 0) ? 0: parseInt(Math.floor(( score - 10) / 2));
            },

            getAbilityPointCost: function(val, neg){
                if(val === 13 && neg){
                    return 2;
                }
                if(val < 14){
                    return 1;
                }
                if(val <= 16){
                    return 2;
                }

            },

            onAbilityScoreResetClick: function(){
                this.showHideAbilityChangeButtons();
                this.ui.abilityPointLabel.text(this.abilityScoreText + this.maxAbilityPoints);
            },


            modalOpen: function(type, key) {
                var modal_width = 540;
                var modal_height = 'auto';
                var additionalModalOpenFn;

                switch (type) {
                    case 'language-modal':
                        modal_width = 200;
                        modal_height = 'auto';
                        break;
                    case 'store-modal':
                        modal_width = 'auto';
                        modal_height = 'auto';
                        break;
                    default:
                        modal_width = 380;
                        modal_height = 'auto';
                        break;
                }

                // create base modal dialog window
                var poundKey = $('#' + key);
                poundKey.dialog({
                    bgiframe : true,
                    autoOpen : false,
                    resizable : false,
                    width : modal_width,
                    minHeight : 190,
                    show : 'fade',
                    hide : 'fade',
                    zIndex : 2000,
                    position : {
                        my : 'top',
                        at : 'top',
                        offset : '0 52'
                    },
                    modal : true,
                    stack : false,
                    closeOnEscape : false,
                    open : _.bind(function(e, ui) {
                        if (additionalModalOpenFn)
                            additionalModalOpenFn($(this));

                        window.setTimeout(function() {
                            jQuery(document).unbind('mousedown.dialog-overlay').unbind('mouseup.dialog-overlay');
                        }, 100);
                        $(".ui-dialog-titlebar").hide();
                        $(".ui-dialog-titlebar-close").hide();

                        $('.ui-widget-overlay').click(function() {
                            $('#' + key).dialog("close");
                        });
                    }, this),
                    close : function() {
                        // do nothing
                    }
                });
                poundKey.dialog('open').height(modal_height);
            },

            modalClose: function(key) {
                // close modal dialog window
                $('#' + key).dialog("close");

                return false;
            }


        });
        epoxy.View.mixin(view.prototype);
        return view;
    })
;




//var success =  _.bind(function(data){
//    console.log(data);
//}, this);
//
//var error = function(xhr, textStatus, errorThrown) {
//    console.log('request failed' + errorThrown);
//}
