import {
  CheckboxInput,
  type FeatureChoiced,
  type FeatureToggle,
} from '../base';
import {
  FeatureDropdownInput,
  FeatureIconnedDropdownInput,
} from '../dropdowns';

export const language: FeatureChoiced = {
  name: 'Язык',
  component: FeatureIconnedDropdownInput,
};

export const language_speakable: FeatureToggle = {
  name: 'Можно говорить на языке',
  description: `Если выключено, вы сможете понимать язык,
    но не говорить на нем.`,
  component: CheckboxInput,
};

export const language_skill: FeatureChoiced = {
  name: 'Знание языка',
  description: 'Процент языка, который вы понимаете.',
  component: FeatureDropdownInput,
};

export const csl_strength: FeatureChoiced = {
  name: 'Знание языка',
  description: 'Процент общегалактического, который вы понимаете.',
  component: FeatureDropdownInput,
};
