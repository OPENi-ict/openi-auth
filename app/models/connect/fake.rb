class Connect::Fake < ActiveRecord::Base
  belongs_to :account

  def userinfo
    OpenIDConnect::ResponseObject::UserInfo::OpenID.new(
      name:         'OPENi Account',
      email:        'alice@openi.com',
      address:      'Alexanderplatz, Berlin, Germany',
      profile:      'http://openi.com/alice',
      locale:       'en_EN',
      phone_number: '+49 1234 5678',
      verified: false
    )
  end

  class << self
    def authenticate
      Account.create!(fake: create!)
    end
  end
end
