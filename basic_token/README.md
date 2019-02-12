## The Basic Token Standard

Our basic token standard demonstrates are light, secure and effective way of operating a token on the Tezos network. This token standard utlizes a few special features:

1) The use of mutez for to for token amounts, as opposed to a nat. This provides additional protections against overflow and other potential issues, and is more suited for the purpose of a token balance

2) We allow for the addition of passthrough data, which if provide, will activate an internal tx call to the receiving contract with parameters regarding the transfer. This is similar to the ERC227 token standard on Ethereum, and allows for easier integrations with dapps (e.g. a DEX)
