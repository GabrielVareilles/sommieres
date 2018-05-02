# frozen_string_literal: true

puts 'Cleaning the database...'
ItemUser.destroy_all
Item.destroy_all
Reservation.destroy_all
Room.destroy_all
Pricing.destroy_all
Modifier.destroy_all
User.destroy_all
Profile.destroy_all
Administrator.destroy_all

users = [
  { email: 'gabriel.vareilles@gmail.com', password: 'password', password_confirmation: 'password'},
  { email: 'manu.vareilles@gmail.com', password: 'password', password_confirmation: 'password'},
  { email: 'isa.vareilles@gmail.com', password: 'password', password_confirmation: 'password'},
  { email: 'beavs@free.fr', password: 'password', password_confirmation: 'password'},
  { email: 'lodv@noos.fr', password: 'password', password_confirmation: 'password'},
  { email: 'jeancassien.gombeaud@gmail.com ', password: 'password', password_confirmation: 'password'}
]

rooms = [
  {
    name: 'Chambre aux Croisillons',
    photos: ['croisillons-2.jpg', 'croisillons-1.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 2,
    description: "un lavabo, précaution et respect indispensables
1 lit double 140 x 190, épaisseur matelas 20 cm (tête et pied de lit fragiles)"
  },
  {
    name: 'Chambre aux Mouches',
    photos: ['mouches.jpg'],
    expositions: ["cour d'honneur", 'clain'],
    capacity: 2,
    description: '2 lits simples 90 x 200, épaisseur matelas 13 cm'
  },
  {
    name: 'Chambre du bout du couloir',
    photos: ['bout.jpg'],
    expositions: ['clain'],
    capacity: 2,
    description: '1 lit double 140 x 190, épaisseur matelas 13 cm'
  },
  {
    name: "Nouvelle Chambre Jaune de l'angle",
    photos: ['brigants.jpg'],
    expositions: %w[village clain],
    capacity: 3,
    description: "3 lits :
- 1 très long lit 110 x 210, épaisseur matelas 15 cm (grands draps plats conseillés)
- 1 lit bateau 100 x 185, épaisseur matelas 13 cm
- 1 lit bateau 100 x 190, épaisseur matelas 18 cm"
  },
  {
    name: 'Grande Chambre Rouge',
    photos: ['rouge-1.jpg', 'rouge-2.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "un lavabo double et donc pas de jeux d’eau, le salon rose est en
dessous ! Les volets sont lourds et fragiles, merci de votre précaution...
1 grand lit double 160 x 200, épaisseur matelas 20 cm"
  },
  {
    name: 'Chambre Jaune à la douche',
    photos: ['jaune-3.jpg', 'jaune-2.jpg', 'jaune-1.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "en cas de forte pluie, il est nécessaire de fermer les volets
de cette chambre, le salon Vareilles en dessous vous en remercie !
1 lit double 160 x 200, épaisseur matelas 18 cm"
  },
  {
    name: 'Chambre Poulailler 1',
    photos: ['poulailler-jaune.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "entre la chambre jaune à la douche et la chambre de l’évêque de
Gap : pas de jeunes enfants car pas assez de protection aux abords de la fenêtre.
Cette chambre est réservée aux adolescents sérieux car les batailles de polochons ne sont
pas autorisées : attention au plafond de l’alcôve de la chambre jaune qui est très fragile...
2 lits simples 90 x 190, épaisseur matelas 13 cm
Apporter housse de couette car ils sont munis chacun d’une couette 140x190"
  },
  {
    name: 'Chambre Bleue',
    photos: ['bleue.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 2,
    description: "un cabinet de toilette en entrant...
1 lit double 140 x 190, épaisseur matelas 18 cm"
  },
  {
    name: "Chambre de l'évêque de Gap",
    photos: ['gap.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "une petite salle de bains non autorisée à des enfants sans
surveillance et donc réservée à des adultes responsables car absence totale de protection
au sol et fuites néfastes pour la grande salle à manger...
1 lit double 160 x 200, épaisseur matelas 22 cm"
  },
  {
    name: 'Chambre Rose',
    photos: ['rose-1.jpg', 'rose-2.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 2,
    description: " uniquement réservée aux adultes responsables
1 lit double 140 x 190, épaisseur matelas 20 cm"
  },
  {
    name: 'Petite chambre suite chambre rose',
    photos: ['suite-rose.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 1,
    description: " 1 adulte ou 1 enfant de parents responsables
1 lit bateau 90 x 185, épaisseur matelas 20 cm
Possibilité d’ajouter 1 lit bébé en toile ou lit parapluie"
  },
  {
    name: 'Petite chambre verte près de la douche',
    photos: ['petite-verte.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 2,
    description: "côté grande cuisine
1 lit double confortable 140 x 190, épaisseur matelas 21 cm"
  },
  {
    name: 'Petite chambre jaune près de la douche',
    photos: ['petite-jaune.jpg'],
    expositions: ["cour d'honneur"],
    capacity: 1,
    description: "côté grande cuisine
1 lit simple 90 x 190, épaisseur matelas 13 cm"
  },
  {
    name: 'Chambre aux Noix',
    photos: ['noix.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "un lavabo dans la penderie
1 lit double 160 x 200, épaisseur matelas 18 cm"
  },
  {
    name: "Chambre à l'oeil de boeuf",
    photos: ['oeil-boeuf.jpg'],
    expositions: ['jardin haut'],
    capacity: 1,
    description: " lit électrique qui n’est pas un jouet et un lavabo (pas de jeux
d’eau…)
1 lit 120 x 190, épaisseur matelas 15 cm"
  },
  {
    name: 'Petite chambre suite chambre aux Noix',
    photos: ['petite-noix.jpg'],
    expositions: ['jardin haut', 'village'],
    capacity: 3,
    description: "entre l’œil-de-bœuf et la chambre aux noix
2 lits simples 90 x 190, épaisseur matelas 13 cm
1 lit d’appoint pliable 90 x 190 environ, épaisseur matelas 10 cm"
  },
  {
    name: 'Chambre aux deux alcôves',
    photos: ['2-alcoves-1.jpg', '2-alcoves-2.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "un cabinet de toilette avec un lavabo (pas de jeux d’eau) pour
jeunes respectueux de ce joli lieu
2 lits bateaux 90/100 x 190, épaisseur matelas 13 cm"
  },
  {
    name: 'Chambre Poulailler 2',
    photos: ['poulailler-2-a.jpg'],
    expositions: ['village'],
    capacity: 2,
    description: "entre les 2 alcôves et la chambre de l’évêque de Gap : pas de jeunes
enfants car pas assez de protection aux abords de la fenêtre. Cette chambre est réservée
aux adolescents sérieux car les batailles de polochons ne sont pas autorisées...
2 lits simples 90 x 190, épaisseur matelas 13 cm"
  }
]

tarifs = [
  {
    name: 'adulte',
    description: 'personne adulte seule.',
    price: 20
  },
  {
    name: 'couple',
    description: 'ménage ou adulte seul avec jeunes enfants dans la limite de 3 enfants de moins de 15 ans.',
    price: 30
  },
  {
    name: 'enfant',
    description: 'mineur seul sans ses parents. Les enfants des ménages au delà de 3 ou entre 15 et 18 ans doivent être comptabilisés dans le tarif enfant.',
    price: 5
  },
  {
    name: 'étudiant',
    description: 'personne majeure, étudiante et non autonome financièrement.',
    price: 10
  }
]

modifiers = [
  {
    name: 'Pleine saison',
    description: 'De début juillet à fin Août. Séjours ouverts à la réservation.',
    percent: 100
  },
  {
    name: 'Basse saison',
    description: "Hors vacances scolaires et pleine saison. Séjours soumis à l'approbation de la SCI.",
    percent: 80
  },
  {
    name: 'Ponts & jours fériés',
    description: "Tarif réservé pour les ponts enjendrés par les jours fériés. Séjours ouverts à la réservation.",
    percent: 90
  },
  {
    name: 'Chantiers',
    description: "Gratuité totale hors ménages pour les participants aux chantiers validés par la SCI.
     Le ménage est à la charge de l'organisateur du chantier. Les chantiers spéciaux sont créés hors Pleine saison.",
    percent: 0
  }
]

puts 'Creating test users...'
User.create(users)
puts 'Users created'

puts 'Creating user profiles'
User.all.each { |user| user.profile }
puts 'Profiles created'

puts 'Creating Pricings...'
Pricing.create(tarifs)
puts 'Pricings created'

puts 'Creating Modifiers...'
Modifier.create(modifiers)
puts 'Modifiers created'

puts 'Creating Rooms'
Room.create(rooms)
puts 'Rooms created....'

puts 'Creating Administrators...'
Administrator.create(email: 'gabriel.vareilles@gmail.com', password: 'inmanibusdominisorsmea', first_name: 'Gabriel', last_name: 'de Vareilles')
Administrator.create(email: 'manu.vareilles@gmail.com', password: 'inmanibusdominisorsmea', first_name: 'Emmanuel', last_name: 'de Vareilles')
Administrator.create(email: 'lodv@noos.fr', password: 'inmanibusdominisorsmea', first_name: 'Louis', last_name: 'de Vareilles')
Administrator.create(email: 'beavs@free.fr', password: 'inmanibusdominisorsmea', first_name: 'Béatrix', last_name: 'de Vareilles')
# Administrator.create(email: "gabriel.vareilles@gmail.com", password: "password", first_name: "Gabriel", last_name: "de Vareilles")
# Administrator.create(email: "gabriel.vareilles@gmail.com", password: "password", first_name: "Gabriel", last_name: "de Vareilles")
puts 'Administrators created...'
