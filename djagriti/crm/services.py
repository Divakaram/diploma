from crm.api import *


def auth_user(phone, password):
    response = get_catalog("Клиенты", params={"$filter": f"(Телефон eq '{phone}') and (Пароль eq '{password}')", "$expand": "Членство"})
    auth_result = response.json()["value"][0]
    type_member_guid = auth_result["Членство"]["ВидЧленства_Key"]
    type_member = {"ВидЧленства": get_object("ВидыЧленства", type_member_guid).json()}
    print(type_member)
    auth_result.update(type_member)
    return auth_result
