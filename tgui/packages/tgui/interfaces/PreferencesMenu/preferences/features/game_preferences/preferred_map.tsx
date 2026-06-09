import type { Feature } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const preferred_map: Feature<string> = {
  name: 'Предпочитаемая карта',
  category: 'GAMEPLAY',
  description: `
    При ротации карт отдавать предпочтение этой карте.
    Не влияет на голосование за карту, только на случайную ротацию без голосования.
  `,
  component: FeatureDropdownInput,
};
