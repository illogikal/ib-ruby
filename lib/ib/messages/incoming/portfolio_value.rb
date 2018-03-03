module IB
  module Messages
    module Incoming

			class ContractMessage < AbstractMessage
				def contract
					@contract = IB::Contract.build @data[:contract]
				end
			end

      PortfolioValue = def_message( [7, 8], ContractMessage,
                                   [:contract, :con_id, :int],
                                   [:contract, :symbol, :string],
                                   [:contract, :sec_type, :string],
                                   [:contract, :expiry, :string],
                                   [:contract, :strike, :decimal],
                                   [:contract, :right, :string],
                                   [:contract, :multiplier, :string],
                                   [:contract, :primary_exchange, :string],
                                   [:contract, :currency, :string],
                                   [:contract, :local_symbol, :string],
                                   [:contract, :trading_class, :string],  # new Version 8
                                   [:position, :decimal],   # changed from int after Server Vers. MIN_SERVER_VER_FRACTIONAL_POSITIONS
                                   [:market_price, :decimal],
                                   [:market_value, :decimal],
                                   [:average_cost, :decimal],
                                   [:unrealized_pnl, :decimal_max], # May be nil!
                                   [:realized_pnl, :decimal_max], #   May be nil!
                                   [:account_name, :string] ) do
        #def to_human
          "<PortfolioValue: #{contract.to_human} (#{position}): Market #{market_price}" +
              " price #{market_value} value; PnL: #{unrealized_pnl} unrealized," +
              " #{realized_pnl} realized; account #{account_name}>"
      end # PortfolioValue


			PositionData =
				def_message( [61,3] , ContractMessage,
					[:account, :string],
                                   [:contract, :con_id, :int],
                                   [:contract, :symbol, :string],
                                   [:contract, :sec_type, :string],
                                   [:contract, :expiry, :string],
                                   [:contract, :strike, :decimal],
                                   [:contract, :right, :string],
                                   [:contract, :multiplier, :string],
                                   [:contract, :primary_exchange, :string],
                                   [:contract, :currency, :string],
                                   [:contract, :local_symbol, :string],
                                   [:contract, :trading_class, :string],  # new Version 8
          [:position, :decimal],   # changed from int after Server Vers. MIN_SERVER_VER_FRACTIONAL_POSITIONS
					[:price, :decimal]
									 ) do 
#        def to_human
          "<PositionValue: #{account} ->  #{contract.to_human} ( Amount #{position}) : Market-Price #{price} >"
        end

			PositionDataEnd = def_message( 62 )


    end # module Incoming
  end # module Messages
end # module IB
