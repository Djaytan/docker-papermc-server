{{- define "papermc-server.name" -}}
{{ default .Chart.Name .Values.name }}
{{- end -}}
