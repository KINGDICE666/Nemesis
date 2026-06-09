import type { FeatureChoiced } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const prisoner_crime: FeatureChoiced = {
  name: 'Преступление заключенного',
  description:
    'When a prisoner, this will be added to your records as the reason for your arrest.',
  component: FeatureDropdownInput,
};
