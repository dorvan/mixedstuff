echo "emerge -uDNgK \\"
cat /var/lib/portage/world |awk '{print ""$1" \\" }'
