export enum Gender {
  Male = 'male',
  Female = 'female',
  Other = 'plural',
  Other2 = 'neuter',
}

export const GENDERS = {
  [Gender.Male]: {
    icon: 'mars',
    text: 'Он/его',
  },

  [Gender.Female]: {
    icon: 'venus',
    text: 'Она/ее',
  },

  [Gender.Other]: {
    icon: 'transgender',
    text: 'Они/их',
  },

  [Gender.Other2]: {
    icon: 'neuter',
    text: 'Оно/его',
  },
};
