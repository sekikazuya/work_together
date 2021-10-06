class industry < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'オフセット印刷' },
    { id: 2, name: 'オンデマンド印刷' },
    { id: 3, name: 'グラビア印刷' },
    { id: 4, name: 'シルク印刷' },
    { id: 5, name: '活版印刷' },
    { id: 6, name: '製本加工' },
    { id: 7, name: 'ラミネート・PP加工' },
    { id: 8, name: '箔押し・エンボス・デボス加工' },
    { id: 9, name: '紙器設計・製作(箱、封筒、紙袋等)' },
    { id: 10, name: '什器設計・製作(店頭、イベントブース等)' },
    { id: 11, name: 'インク販売、特殊インキ製造' },
    { id: 12, name: '紙販売・特殊用紙製造' },
    { id: 13, name: 'アセンブリ・梱包・発送手配' },
    { id: 14, name: '空間施工(屋内・屋外、イベントブース等)' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :companies

end