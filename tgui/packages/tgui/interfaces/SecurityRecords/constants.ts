export const CRIMESTATUS2COLOR = {
  Arrest: 'bad',
  Discharged: 'blue',
  Incarcerated: 'average',
  Parole: 'good',
  Suspected: 'teal',
} as const;

export const CRIMESTATUS2DESC = {
  Arrest: 'Арест. Для этого статуса у цели должны быть действующие преступления.',
  Discharged: 'Оправдан. Персона снята с обвинений.',
  Incarcerated: 'Заключен. Персона отбывает срок.',
  Parole: 'УДО. Освобожден из заключения, но остается под надзором.',
  Suspected: 'Подозреваемый. Следите за возможной преступной активностью.',
} as const;

export const CRIMESTATUS2LABEL = {
  Arrest: 'Арест',
  Discharged: 'Оправдан',
  Incarcerated: 'Заключен',
  Parole: 'УДО',
  Suspected: 'Подозреваемый',
} as const;
