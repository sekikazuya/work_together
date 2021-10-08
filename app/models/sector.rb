class Sector < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '印刷' },
    { id: 2, name: '製本' },
    { id: 3, name: '表面加工' },
    { id: 4, name: '紙器製作・加工' },
    { id: 5, name: '什器設計・製作' },
    { id: 6, name: 'インキ・塗料' },
    { id: 7, name: '紙販売' },
    { id: 8, name: 'アセンブリ・梱包・発送' },
    { id: 9, name: '空間施工' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :companies

end