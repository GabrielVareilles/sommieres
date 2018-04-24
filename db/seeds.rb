# frozen_string_literal: true

puts 'Cleaning the database...'
Room.destroy_all

rooms = [
  {
    name: "Chambre aux Croisillons",
    photos: ['croisillons-1', 'croisillons-2'],
    description: ""
  },
  {
    name: "Chambre aux Mouches",
    photos: ['mouches'],
    description: ""
  },
  {
    name: "Chambre du bout du couloir",
    photos: ['bout'],
    description: ""
  },
  {
    name: "Nouvelle Chambre Jaune de l'angle",
    photos: ['brigants'],
    description: ""
  },
  {
    name: "Grande Chambre Rouge",
    photos: ['rouge-1', 'rouge-2'],
    description: ""
  },
  {
    name: "Chambre Jaune à la douche",
    photos: ['jaune-1', 'jaune-2', 'jaune-3'],
    description: ""
  },
  {
    name: "Chambre Poulailler 1",
    photos: ['poulailler-jaune'],
    description: ""
  },
  {
    name: "Chambre Bleue",
    photos: ['bleue'],
    description: ""
  },
  {
    name: "Chambre de l'évêque de Gap",
    photos: ['gap'],
    description: ""
  },
  {
    name: "Chambre Rose",
    photos: ['rose-1', 'rose-2'],
    description: ""
  },
  {
    name: "Petite chambre suite chambre rose",
    photos: ['suite-rose'],
    description: ""
  },
  {
    name: "Petite chambre verte",
    photos: ['petite-verte'],
    description: ""
  },
  {
    name: "Petite chambre jaune",
    photos: ['petite-jaune'],
    description: ""
  },
  {
    name: "Chambre aux Noix",
    photos: ['noix'],
    description: ""
  },
  {
    name: "Chambre à l'oeil de boeuf",
    photos: ['oeil-boeuf'],
    description: ""
  },
  {
    name: "Petite chambre suite chambre aux Noix",
    photos: ['petite-noix'],
    description: ""
  },
  {
    name: "Chambre aux deux alcôves",
    photos: ['2-alcoves-1', '2-alcoves-2'],
    description: ""
  },
  {
    name: "Chambre Poulailler 2",
    photos: ['poulailler-2-a'],
    description: ""
  }
]

puts 'Creating Rooms'
Room.create(rooms)
puts 'Rooms created....'
