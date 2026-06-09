import { type Antagonist, Category } from '../base';

const Nightmare: Antagonist = {
  key: 'nightmare',
  name: 'Кошмар',
  description: [
    `
      Используйте пожиратель света, чтобы ломать источники света, выживать и усиливаться.
      Скользите сквозь тьму и ищите добычу ночным зрением.
    `,
  ],
  category: Category.Midround,
};

export default Nightmare;
