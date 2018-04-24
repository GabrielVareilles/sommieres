# frozen_string_literal: true

puts 'Cleaning the database...'
Room.destroy_all

rooms = [
  {
    name: "Chambre aux Croisillons",
    photos: ['croisillons-1', 'croisillons-2'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Chambre aux Mouches",
    photos: ['mouches'],
    expositions: ["cour d'honneur", "clain"],
    description: ""
  },
  {
    name: "Chambre du bout du couloir",
    photos: ['bout'],
    expositions: ['clain'],
    description: ""
  },
  {
    name: "Nouvelle Chambre Jaune de l'angle",
    photos: ['brigants'],
    expositions: ["village", "clain"],
    description: ""
  },
  {
    name: "Grande Chambre Rouge",
    photos: ['rouge-1', 'rouge-2'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre Jaune à la douche",
    photos: ['jaune-1', 'jaune-2', 'jaune-3'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre Poulailler 1",
    photos: ['poulailler-jaune'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre Bleue",
    photos: ['bleue'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Chambre de l'évêque de Gap",
    photos: ['gap'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre Rose",
    photos: ['rose-1', 'rose-2'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Petite chambre suite chambre rose",
    photos: ['suite-rose'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Petite chambre verte",
    photos: ['petite-verte'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Petite chambre jaune",
    photos: ['petite-jaune'],
    expositions: ["cour d'honneur"],
    description: ""
  },
  {
    name: "Chambre aux Noix",
    photos: ['noix'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre à l'oeil de boeuf",
    photos: ['oeil-boeuf'],
    expositions: ["jardin haut"],
    description: ""
  },
  {
    name: "Petite chambre suite chambre aux Noix",
    photos: ['petite-noix'],
    expositions: ["jardin haut", "village"],
    description: ""
  },
  {
    name: "Chambre aux deux alcôves",
    photos: ['2-alcoves-1', '2-alcoves-2'],
    expositions: ["village"],
    description: ""
  },
  {
    name: "Chambre Poulailler 2",
    photos: ['poulailler-2-a'],
    expositions: ["village"],
    description: ""
  }
]

puts 'Creating Rooms'
Room.create(rooms)
puts 'Rooms created....'
