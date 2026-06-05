{{- define "jit-helm.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
jit-rbac/app: {{ .Release.Name }}
{{- end }}

{{- define "jit-helm.jitAnnotations" -}}
argocd.argoproj.io/hook: PreSync
argocd.argoproj.io/hook-delete-policy: {{ .Values.hookDeletePolicy }}
argocd.argoproj.io/sync-wave: {{ .Values.syncWave | quote }}
argocd.argoproj.io/sync-options: Prune=true
{{- end }}

{{- define "jit-helm.markerAnnotations" -}}
argocd.argoproj.io/hook: PostSync
argocd.argoproj.io/hook-delete-policy: {{ .Values.hookDeletePolicy }}
argocd.argoproj.io/sync-wave: "98"
argocd.argoproj.io/sync-options: Prune=true
{{- end }}

{{- define "jit-helm.jobAnnotations" -}}
argocd.argoproj.io/hook: PostSync
argocd.argoproj.io/hook-delete-policy: {{ .Values.hookDeletePolicy }}
argocd.argoproj.io/sync-wave: "99"
{{- end }}
