This is an example deployment using Kustomize. Kustomize allows you to ship
almost completely unmodified Kubernetes manifests (or rather, unmodified
manifests with some added metadata which tells Kustomize what to do) but
also allows for some powerful Helm-like features and such.

The idea is that the base/ folder contains the actual manifests we want to
use, and the dev/ and prod/ folders contain different "versions" of the
service, based on modifications you might want to make to either.

The examples here are based on a modification of Lodge's work + the details
found in https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/#bases-and-overlays

