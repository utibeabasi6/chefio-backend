import { createSchema, list } from '@keystone-next/keystone/schema';
import {
  text,
  relationship,
  password,
  timestamp,
  image,
  float,
  decimal,
} from '@keystone-next/fields';

export const lists = createSchema({
  User: list({
    fields: {
      name: text({ isRequired: true }),
      email: text({ isRequired: true, isUnique: true }),
      password: password({ isRequired: true }),
      recipies: relationship({ ref: 'Recipie.author', many: true }),
      following: relationship({ ref: 'User.followers', many: true }),
      followers: relationship({ ref: 'User.following', many: true }),
    },
  }),
  
  Recipie: list({
    fields: {
      name: text(),
      description: text(),
      author: relationship({ref: "User.recipies", many: false,}),
      image: image(),
      steps: relationship({ref: "Step", many: true}),
      time: decimal(),
      ingredients: relationship({many: true, ref: 'Ingredient'})
    },
  }),
  Step: list({
    fields: {
      name: text(),
      image: image()
    }
  }),
  Ingredient: list({
    fields: {
      name: text(),
      quantity: float()
    }
  })
});
