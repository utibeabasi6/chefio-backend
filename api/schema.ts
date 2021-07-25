import { createSchema, list } from '@keystone-next/keystone/schema';
import {
  text,
  relationship,
  password,
  select,
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
      image: image(),
      recipies: relationship({ ref: 'Recipie.author', many: true }),
      following: relationship({ ref: 'User.followers', many: true }),
      followers: relationship({ ref: 'User.following', many: true }),
      likes: relationship({ ref: 'Recipie.likes', many: true }),
    },
  }),

  Recipie: list({
    fields: {
      name: text(),
      category: select({
        options: [
          {
            label: "Food",
            value: "Food"
          },
          {
            label: "Drink",
            value: "Drink"
          },
        ], defaultValue: "Food",
      }),
      description: text(),
      author: relationship({ ref: "User.recipies", many: false, }),
      image: text(),
      steps: relationship({ ref: "Step", many: true }),
      time: decimal(),
      ingredients: relationship({ many: true, ref: 'Ingredient' }),
      likes: relationship({many: true, ref: "User.likes"})
    },
  }),
  Step: list({
    fields: {
      name: text(),
      image: text()
    }
  }),
  Ingredient: list({
    fields: {
      name: text(),
      quantity: float()
    }
  })
});
