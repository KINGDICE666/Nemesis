import { CheckboxInput, type FeatureToggle } from '../base';

export const windowflashing: FeatureToggle = {
  name: 'Мигание окна',
  category: 'UI',
  description: `
    Если включено, важные события будут заставлять значок игры мигать
    на панели задач.
  `,
  component: CheckboxInput,
};
