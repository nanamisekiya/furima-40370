FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '1234qwer' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2013-05-03' }
  end
end
