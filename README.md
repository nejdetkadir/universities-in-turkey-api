# Universities in Turkey API
Official source: [www.osym.gov.tr](https://www.osym.gov.tr/TR,21247/2021-yuksekogretim-kurumlari-sinavi-yks-yuksekogretim-programlari-ve-kontenjanlari-kilavuzu.html)

## Authentication
| Route | HTTP Verb | Post Body | Header Body | Description |
| --- | --- | --- | --- | --- |
| /api/v1/users | `POST` | {user: {email: "foo@bar.com", password: "mypass"}} | Empty | Sing up |
| /api/v1/users/sign_in | `POST` | {user: {email: "foo@bar.com", password: "mypass"}} | Empty | Sign in |
| /api/v1/users/sign_out | `DELETE` | Empty  | Authentication: Bearer Token | Sign out |

## Universities
| Route | HTTP Verb	| Header Body | Description	 |
| --- | --- | --- | --- |
| /api/v1/universities | `GET` | Authentication: Bearer Token | Get all universities |
| /api/v1/universities/:id | `GET` | Authentication: Bearer Token | Get single university with associations |

## Faculties
| Route | HTTP Verb	| Header Body | Description	 |
| --- | --- | --- | --- |
| /api/v1/faculties | `GET` | Authentication: Bearer Token | Get all faculties |
| /api/v1/faculties/:id | `GET` | Authentication: Bearer Token | Get single faculty with associations |

## Colleges
| Route | HTTP Verb	| Header Body | Description	 |
| --- | --- | --- | --- |
| /api/v1/colleges | `GET` | Authentication: Bearer Token | Get all colleges |
| /api/v1/colleges/:id | `GET` | Authentication: Bearer Token | Get single college with associations |

## Deparrtments
| Route | HTTP Verb	| Header Body | Description	 |
| --- | --- | --- | --- |
| /api/v1/departments | `GET` | Authentication: Bearer Token | Get all departments |
| /api/v1/departments/:id | `GET` | Authentication: Bearer Token | Get single department with associations |

# LICENSE
```
GNU GENERAL PUBLIC LICENSE Version 3
```