INSERT INTO backend_api_config (
    web_client_url
) VALUES (
    'http://localhost'
);

INSERT INTO users (email, salt, password)
VALUES (
    'test@test.com',
    'ce8db3ed3c849e56f379ce21b3cfd427b522b50b8c28ab89593c7dcc4d6f114b5dddc4f07911d2c2513f8421512a68a33da74ab68e23719c03064665ce7c5505',
    'ac1f3b275cf5e8838c786a5bbfb556d800e75e0f77ecf1d8ab2f0561e63010416b6b2817fcc7dd5d9330650076f44b5d070d5467c58dd01182c1ded7ebf97a8b'
);