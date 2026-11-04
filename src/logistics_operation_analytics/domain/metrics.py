from dataclasses import dataclass, field
from datetime import timedelta
from uuid import UUID, uuid4


@dataclass
class Metrics:
    id: UUID = field(default_factory=uuid4)
    snapshot_sector_id: UUID | None = None
    production: int = 0
    cumulative_production: int = 0
    estimated_avg_time: timedelta | None = None
