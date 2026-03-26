let jokers = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Common"
  // }
  
{
name: "One Stock",
text: [
"{C:red}+20{} Mult on final hand of round"
],
image_url: "img/jokers/morgancard.png",
rarity: "Common"
},
{
name: "Pin This!",
text: [
'Gain a {C:attention}Pin {}after each {C:blue}Hand {}played',
'After {C:attention}5{} {C:attention}Pins{}, create a random {C:attention}Tag{}',
],
image_url: "img/jokers/pinthis.png",
rarity: "Uncommon"
},
{
name: "Hanging Morgan",
text: [
'Add {C:red}Mult {}of played {C:attention}poker hand{}',
'{C:attention}2{} additional times'
],
image_url: "img/jokers/Hanging Morgan.png",
rarity: "Rare"
},
{
name: "Nagrom",
text: [
'{C:red}+20{} Mult on first hand of round'
],
image_url: "img/jokers/nagrom.png",
rarity: "Common"
},
{
name: "Moeker",
text: [
"{X:red,C:white}X2{} Mult between 10 PM and 6 AM"
],
image_url: "img/jokers/moeker.png",
rarity: "Common"
},
{
name: "Goddamn Pie",
text: [
'{X:red,C:white}X4{} Mult, {C:green}1 in 20 chance{} for {C:red}Game Over{}'
],
image_url: "img/jokers/pie.png",
rarity: "Uncommon"
},
{
name: "Best of Balatro",
text: [
'{C:green}1 in 4 Chance{} for {C:red}+15{} Mult',
'{C:green}1 in 4 Chance{} for {C:blue}+150{} Chips',
'{C:green}1 in 4 Chance{} for {X:red,C:white}X1.5{} Mult',
'{C:green}1 in 4 Chance{} for {X:blue,C:white}X1.5{} Chips'
],
image_url: "img/jokers/bestofslurp.png",
rarity: "Common"
},
{
name: "John",
text: [
'Copies ability of every',
'other {C:attention}Joker{}'
],
image_url: "img/jokers/john.png",
soul: true,
rarity: "Legendary"
},
{
name: "Up Smash",
text: [
'Gain {X:red,C:white}0.5X{} Mult per {C:blue}Hand{} played',
'Resets after round'
],
image_url: "img/jokers/upsmash.png",
rarity: "Uncommon"
},
{
name: "Rivals Bet",
text: [
'{C:green}1 in 4 Chance{} to win {C:money}$5{} every {C:blue}Hand {}played'
],
image_url: "img/jokers/rivalsbet.png",
rarity: "Uncommon"
},
{
name: "Bubbly",
text: [
'{C:inactive}0/50 Discarded...{}'
],
image_url: "img/jokers/bubbly.png",
rarity: "Common"
},
{
name: "Adam Stare",
text: [
'{X:mult,C:white}X0.5{} Mult, Only triggers as the last Joker',
'Sell this card for {C:attention}+1{} {C:legendary}Joker Slot{} after',
'triggering 10 times',
],
image_url: "img/jokers/adam stare.png",
rarity: "Uncommon"
},
{
name: "The Curse",
text: [
'{C:red}-1{} Hand, Excess {C:attention}Score {}this {C:attention}Ante {}is subracted',
'from the {C:attention}Boss Blind{}',
'{C:inactive}The sins of the father are to be laid upon the children.{}'
],
image_url: "img/jokers/charles.png",
rarity: "Rare"
},
{
name: "Fire Writing Joker",
text: [
'{C:red}+3{} Mult every time your',
'score catches on fire',
],
image_url: "img/jokers/firewriting.png",
rarity: "Uncommon"
},
{
name: "Profit City",
text: [
'Every source of income',
'grants an extra {C:money}$1{}'
],
image_url: "img/jokers/profitcity.png",
rarity: "Uncommon"
},
{
name: "Galss Joker",
text: [
'This Joker will {C:red}Level Down{} the',
'Played {C:planet}Poker Hand{}, giving {X:mult,C:white}X0.25{} Mult',
],
image_url: "img/jokers/galssjoker.png",
rarity: "Uncommon"
},
{
name: "Assimilated Joker",
text: [
'If {C:attention}4/5 {}selected Cards have the',
'same {C:purple}Suit{}, Assimilate the{C:attention} 5th{} card{}',
'Works once each {C:blue}Hand{}'
],
image_url: "img/jokers/assimilatedjoker.png",
rarity: "Rare"
},
{
name: "Mega Crush",
text: [
'Retrigger a random {C:attention}Joker{}',
'for the next {C:blue}10{} Hands'
],
image_url: "img/jokers/megacrush.png",
rarity: "Common"
},
{
name: "No Ordinary Cat",
text: [
'{C:green} 1 in 4 {} chance to',
'create a {C:purple}Blessing of Juan{}',
'after each round',
],
image_url: "img/jokers/noordinarycat.png",
rarity: "Common"
},
{
name: "Future Vision",
text: [
'The next {C:attention}5{} cards to be drawn...',
],
image_url: "img/jokers/futurevision.png",
rarity: "Rare"
},
{
name: "Archer of Jokersvale",
text: [
'Every {C:green}Chance {}outside of a {C:attention}Blind{}',
'is guaranteed, First {C:green}Chance {}',
'in a {C:attention}Blind {}is also guaranteed'
],
image_url: "img/jokers/archer of jokersvale.png",
rarity: "Rare"
},
]

// works the same. 
let consumables = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Tarot"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Planet"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Spectral"
  // },
  
 {
name: "Blessing Of Juan",
text: [
'Create a random {C:purple}Slurpzon{} {C:attention}Joker{}',
'If {C:attention}Joker{} slots are full, enhance{}',
'an unenhanced {C:purple}Slurpzon{} {C:attention}Joker{}'
],
image_url: "img/jokers/jauntarot.png",
rarity: "Tarot"
},
]

let card_modifications = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Enhancement"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Edition"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Seal"
  // },
  
  
]

let decks = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Deck"
  // },
   {
name: "Slurpzite Deck",
text: [
'Start run with {C:attention}2{}',
'{C:purple}Blessings Of Juan{}',
],
image_url: "img/jokers/slurpzitesdeck.png",
rarity: "Deck"
},
 {
name: "Orange Deck",
text: [
'Start run with',
'{C:attention}52{} Random',
'{C:diamonds}Diamond {}Cards'
],
image_url: "img/jokers/orangedeck.png",
rarity: "Deck"
},
 {
name: "Slurpzite Sleeve",
text: [
'{C:attention}Double up{} to recieve another {C:purple}Blessing Of Juan{}',
'after defeating a {C:attention}Boss Blind{}',
'{C:purple}John{} may be blessed'
],
image_url: "img/jokers/slurpzitesleeve.png",
rarity: "Sleeve"
},
 {
name: "Orange Sleeve",
text: [
'{C:attention}Double up{} to recieve',
'{C:attention}13{} {C:diamonds}Diamond {}Cards',
],
image_url: "img/jokers/orangesleeve.png",
rarity: "Sleeve"
},
]

let stickers = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Sticker"
  // },
  
 {
name: "King of Hearts",
text: [
'{C:attention}Me.{}',
],
image_url: "img/jokers/slurpheartking.png",
rarity: "Face Card"
},
 {
name: "Queen of Hearts",
text: [
'{C:attention}Juan{}',
],
image_url: "img/jokers/slurpheartqueen.png",
rarity: "Face Card"
},
 {
name: "Jack of Hearts",
text: [
'{C:attention}The Fixer{}',
],
image_url: "img/jokers/slurpheartjack.png",
rarity: "Face Card"
},
]

let blinds = [
  // {
  //   name: "The Wall",
  //   text: [
  //     "Extra large blind",
  //     "{C:inactive}({C:red}4x{C:inactive} Base for {C:attention}$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 2)"
  //   ],
  //   image_url: "img/the_wall.png",
  //   rarity: "Boss Blind"
  // },
  // {
  //   name: "Violet Vessel",
  //   text: [
  //     "Very large blind",
  //     "{C:inactive}({C:red}6x{C:inactive} Base for {C:attention}$$$$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 8)"
  //   ],
  //   image_url: "img/violet_vessel.png",
  //   rarity: "Showdown"
  // },
]

let shop_items = [

]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sticker": "#5d5dff",
  "Face Card": "#fd682b",
  "Sleeve": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",
}

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div) => {
  for (let joker of jokers) {
    console.log("adding joker", joker.name);
  
    joker.text = joker.text.map((line) => { return line + "{}"});
  
    joker.text = joker.text.join("<br/>");
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");
  
      let css_styling = "";
  
      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }
  
      return `</span><span style='${css_styling}'>`;
    });
  
    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }
  
    jokers_div.appendChild(joker_div);
  }
}

if (jokers.length === 0) {
  document.querySelector(".jokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".jokers");
  add_cards_to_div(jokers, jokers_div);
}

if (consumables.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables, consumables_div);
}

if (card_modifications.length === 0) {
  document.querySelector(".cardmodsfull").style.display = "none"
} else {
  let cardmods_div = document.querySelector(".cardmods");
  add_cards_to_div(card_modifications, cardmods_div);
}

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (stickers.length === 0) {
  document.querySelector(".stickersfull").style.display = "none"
} else {
  let stickers_div = document.querySelector(".stickers");
  add_cards_to_div(stickers, stickers_div);
}

if (blinds.length === 0) {
  document.querySelector(".blindsfull").style.display = "none"
} else {
  let blinds_div = document.querySelector(".blinds");
  add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
  document.querySelector(".shopitemsfull").style.display = "none"
} else {
  let shopitems_div = document.querySelector(".shopitems");
  add_cards_to_div(shop_items, shopitems_div);
}
