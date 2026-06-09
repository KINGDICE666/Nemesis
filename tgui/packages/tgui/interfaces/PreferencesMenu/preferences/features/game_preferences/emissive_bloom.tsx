import { type Feature, FeatureSliderInput } from '../base';

export const emissive_bloom: Feature<number> = {
  name: 'Сила свечения',
  category: 'GAMEPLAY',
  description: `Насколько сильно светятся эмиссивные объекты, например экраны компьютеров. Почти не влияет на производительность.`,
  component: FeatureSliderInput,
};
