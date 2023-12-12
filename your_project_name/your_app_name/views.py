from django.http import JsonResponse
from .models import YourModel

def get_data(request):
    data = YourModel.objects.values()  # Replace with your actual model
    return JsonResponse(list(data), safe=False)

