# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [gacha/gacha.proto](#gacha_gacha-proto)
    - [BuyRequest](#gacha-BuyRequest)
    - [BuyResponse](#gacha-BuyResponse)
  
    - [Gacha](#gacha-Gacha)
  
- [item/item.proto](#item_item-proto)
    - [Item](#item-Item)
  
- [user/user.proto](#user_user-proto)
    - [CreateRequest](#user-CreateRequest)
    - [CreateResponse](#user-CreateResponse)
    - [ListUserItemsRequest](#user-ListUserItemsRequest)
    - [ListUserItemsResponse](#user-ListUserItemsResponse)
  
    - [User](#user-User)
  
- [Scalar Value Types](#scalar-value-types)



<a name="gacha_gacha-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## gacha/gacha.proto



<a name="gacha-BuyRequest"></a>

### BuyRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user_id | [string](#string) |  | ユーザーID |
| gacha_id | [string](#string) |  | ガチャID |






<a name="gacha-BuyResponse"></a>

### BuyResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item | [item.Item](#item-Item) |  | ガチャで当選したアイテム |





 

 

 


<a name="gacha-Gacha"></a>

### Gacha
ガチャ関係の処理

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Buy | [BuyRequest](#gacha-BuyRequest) | [BuyResponse](#gacha-BuyResponse) | ガチャを購入する |

 



<a name="item_item-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## item/item.proto



<a name="item-Item"></a>

### Item



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item_id | [string](#string) |  | アイテムID |
| name | [string](#string) |  | アイテム名 |
| count | [int32](#int32) |  | アイテム所持数 |





 

 

 

 



<a name="user_user-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## user/user.proto



<a name="user-CreateRequest"></a>

### CreateRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | 氏名 |






<a name="user-CreateResponse"></a>

### CreateResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | ユーザーid |
| name | [string](#string) |  | ユーザー氏名 |
| created_at | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | ユーザー作成日 |






<a name="user-ListUserItemsRequest"></a>

### ListUserItemsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| user_id | [string](#string) |  | ユーザーid |






<a name="user-ListUserItemsResponse"></a>

### ListUserItemsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| items | [item.Item](#item-Item) | repeated | ユーザー所持アイテム一覧 |





 

 

 


<a name="user-User"></a>

### User
ユーザー関係の処理

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Create | [CreateRequest](#user-CreateRequest) | [CreateResponse](#user-CreateResponse) | ユーザーを新規で作成する |
| ListUserItems | [ListUserItemsRequest](#user-ListUserItemsRequest) | [ListUserItemsResponse](#user-ListUserItemsResponse) | ユーザーが所持しているアイテム一覧を取得する |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

