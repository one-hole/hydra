# 1xxx: Authentication errors               没有认证
# 2xxx: HTTP params validation errors       参数错误
# 3xxx: Authorization errors                没有权限
# 4xxx: Domain errors
# 5xxx: Other errors
# 6xxx: Record errors                       Record not Found not Updated not Deleted

module ApiErrorConcern

  class AuthenticationError < ApiError
    def initialize
      super code: 1001, text: 'Un Authentication', status: 400
    end
  end

  class PasswordError < ApiError
    def initialize
      super code: 2001, text: 'Password Error', status: 401
    end
  end

  class PhoneNotFoundError < ApiError
    def initialize
      super code: 6001, text: 'Can not found user by given phone', status: 404
    end
  end

  class BcOrderNotFoundError < ApiError
    def initialize
      super code: 6002, text: 'ACCEPTED BcOrder Not Found', status: 404
    end
  end

  class ChargeOrderBuildError < ApiError
    def initialize
      super code: 6004, text: 'ChargeOrder Build Error', status: 404
    end
  end

  class ChargeOrderNotFoundError < ApiError
    def initialize
      super code: 6004, text: 'ChargeOrder Not Found', status: 404
    end
  end
end
