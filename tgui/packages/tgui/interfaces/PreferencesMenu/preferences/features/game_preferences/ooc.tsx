import { type Feature, FeatureColorInput } from '../base';

export const ooccolor: Feature<string> = {
  name: 'Цвет OOC',
  category: 'CHAT',
  description: 'Цвет ваших сообщений в OOC.',
  component: FeatureColorInput,
};
