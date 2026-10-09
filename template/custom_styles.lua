function Header(el)
  print("[LOG Header] Titre trouvé : " .. pandoc.utils.stringify(el))
  print("[LOG Header] Classes : " .. table.concat(el.classes, ", "))
  if el.classes:includes('t1-sans-num') then
    print("[LOG Header] Applique Titre _Titre_1_Sans_Numérotation")
    el.attributes['custom-style'] = '_Titre_1_Sans_Numérotation'
  elseif el.level == 1 then
    print("[LOG Header] Applique Titre _Titre 1 Seul")
    el.attributes['custom-style'] = '_Titre 1 Seul'
  end
  return el
end

-- Gestion des Paragraphes
function Div(el)
  -- Exemple : <p class="chapeau"> ou [Texte]{.chapeau} en Markdown
  if el.classes:includes('chapeau') then
    el.attributes['custom-style'] = '_Premier Paragraphe'
  elseif el.classes:includes('espace-apres') then
    el.attributes['custom-style'] = 'espace-apres'
  elseif el.classes:includes('page-titre') then
    local img = pandoc.Image({}, "Les Intacts/Chroniques.png")
    img.attributes["width"] = "12.4cm"
    img.attributes["height"] = "4.6cm"
    local para = pandoc.Para({img})

    -- 3. Englobement dans un Div qui porte le style de paragraphe ODT
    local attr = pandoc.Attr("", {}, { ['custom-style'] = '_Titre_Livre' })
    local div = pandoc.Div({para}, attr)

    return div
  elseif el.classes:includes('logo-editeur') then
    local img = pandoc.Image({}, "../fivez_logo_vertical_black_tranche.png")
    img.attributes["width"] = "2.71cm"
    img.attributes["height"] = "1.91cm"
    local para = pandoc.Para({img})

    -- 3. Englobement dans un Div qui porte le style de paragraphe ODT
    local attr = pandoc.Attr("", {}, { ['custom-style'] = '_Logo_Editeur' })
    local div = pandoc.Div({para}, attr)

    return div
  elseif el.classes:includes('sous-titre-livre') then
    el.attributes['custom-style'] = '_Sous_Titre_Livre'
  elseif el.classes:includes('nom-auteur') then
    el.attributes['custom-style'] = '_Nom_Auteur'
  elseif el.classes:includes('page-mentions') then
    el.attributes['custom-style'] = '_Page_Mentions'
  elseif el.classes:includes('page-mentions-espace') then
    el.attributes['custom-style'] = '_Page_Mentions_Espace'
  elseif el.classes:includes('page-carte') then
    el.attributes['custom-style'] = '_Page_Carte'
  elseif el.classes:includes('sous-titre') then
    el.attributes['custom-style'] = '_Sous Titre'
  end
  return el
end

function HorizontalRule(el)
  -- Définition du chemin de l'image SVG
  local img = pandoc.Image({}, "section_separator.svg")
    -- Dimensions (en points ou pouces, ex: 1.5 inch x 0.3 inch)
  img.attributes["width"] = "6.7cm"
  img.attributes["height"] = "0.5cm"
  
  -- 2. Création du paragraphe contenant l'image
  local para = pandoc.Para({img})

  -- 3. Englobement dans un Div qui porte le style de paragraphe ODT
  local attr = pandoc.Attr("", {}, { ['custom-style'] = '_separateur_centre' })
  local div = pandoc.Div({para}, attr)

  return div
end