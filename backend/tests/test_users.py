# backend/tests/test_users.py

def test_create_user(client, db_session):
    response = client.post(
        "/users/",
        json={"username": "testuser", "email": "testuser@example.com", "password": "securepassword"},
    )
    assert response.status_code == 200
    assert response.json()["username"] == "testuser"
    assert response.json()["email"] == "testuser@example.com"

def test_get_users(client, db_session):
    response = client.get("/users/")
    assert response.status_code == 200
    assert len(response.json()) >= 0
