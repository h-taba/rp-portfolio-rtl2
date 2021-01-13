from django.shortcuts import render

def ui_index(request):
    
    context = {"header": "This is test Index for UI "}
    return render(request, "ui_index.html", context)
