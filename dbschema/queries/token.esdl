insert Token {
  access_token := "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjU4MjU0MzE4Mi0zYzFjLTRiMzktYTZhMi0yNGUxOTJiZjBmZGQiLCJ0eXAiOiJhdCtqd3QifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLm1hcmNlLmFwcGxlIiwic3ViIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIiwiaWF0IjoxNjE5MjIwODM1LCJleHAiOjE2MTkyMjQ0MzUsImFjciI6IjAiLCJhbXIiOlsicGFzc3dvcmQiXSwibm9uY2UiOiI0ZjFkZDhiOS0zZGU4LTQ0NGYtYmY4My1iODUxMDM2NGIwZjMiLCJhdXRoX3RpbWUiOjE2MTkyMjA4MzV9.S3SLyTWdcdmh0ugA_0-6oATQ2pbM1Y10X1J02fFzDCV7Ug0nAxQ2stUxv6AG8WlUzg6mAGaxJHdGv8C-7O9oSQ",
  refresh_token := "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjU4MjU0MzE4Mi0zYzFjLTRiMzktYTZhMi0yNGUxOTJiZjBmZGQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLm1hcmNlLmFwcGxlIiwic3ViIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIiwiaWF0IjoxNjE5MjIwODM1LCJleHAiOjE2MjA4MTIwMzUsImFjciI6IjAiLCJhdXRoX3RpbWUiOjE2MTkyMjA4MzV9.A_9XJZDmTwgsGdQ2Kzoq3lJz0HfPwRcgmGRp0jK9H5utpYPkWR-Q_8gS_R5SYYLVav2YhYw4K1Fv4d4KZ44-QQ",
  expiry := 3600,
  tokenid := "eyJraWQiOiJBSUR",
  token_type := "bearer",
  identity := (select Identity filter .login = "@janedoe" Limit 1)
}

insert Token {
  access_token := "ya29.a0AfH6SMApM1yLXsOpyz1iCnZwkxOxRgHtK0",
  refresh_token := "1//0g9qw2ywV7_rECgYIARAAGBASNwF-L9IrYp-zw",
  expiry := 3599,
  tokenid := "eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ4YjlkN2JhMmVjYjM3NTM3ZmJhZjczYmU5YjRjYmM5MTNlODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwic3ViIjoiMTA5MzIyMjkyMTMzNDM1NTgwMTIxIiwiYXpwIjoiMTIzNDU2Nzg5MjMxLXN1YnNjcmliLWJldGEtYmFja2VuZC1hY2NvdW50LXByb2plY3QiLCJzY29wZSI6ImNvbW1hbmQtYWRtaW5zOmFsbCIsImF0X2hhc2giOiJ6SmlUOUh2UmtIVkZ4eHRfX2pwWkNBX1Y5YjJRIiwiaGQiOiJnYXRld2F5LmNvbSIsImlhdCI6MTYzMjQ2NTMwNywiZXhwIjoxNjMyNDY4OTA3fQ.Lr1rY21Rg50UIpPYUaHT6kz7VJnOU6IBz7VZfgD6Zn7FZfhPnUrcA6e8Jy0LRm5ed5PK5AE5BjX8WMS-W5PvGBDmTkjK1EIn8xHJ4l29kIfoOo72_WzX8ZaSv_qJfQj36q3d3eIn4x4t4HjK4fozIbdp83XLPWrsSvS2Fk1q3c_jyQxW-S87vNMdJCVOr5b5KZ9lW43lCpVRG84Bk45RA1lmU6-yjK6wF0EBvdOvwz7Q9LRPAa0L7YmJ0pyiE7LLo_zKNOBv7Qsk37_ZAZqVJLXZC-mrT1NlOYfIFlN6xAMU6wfcUzCYdU6_yfBkbGT9QV-0nfnCkU6-X_J-Yw",
  token_type := "Bearer",
  identity := (select Identity filter .login = "@captainamerica" Limit 1)
}